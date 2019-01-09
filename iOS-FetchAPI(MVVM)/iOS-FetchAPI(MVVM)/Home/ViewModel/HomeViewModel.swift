//
//  HomeViewModel.swift
//  iOS-FetchAPI(MVVM)
//
//  Created by Jack Wong on 2019/01/06.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import SVProgressHUD
import Foundation
import RxSwift

struct HomeViewModel {
    //Output
    var photos: Observable<[PhotoDetailList]> {
        return self.photoVariable.asObservable()
    }
    var isLoading: Observable<Bool> {
        return self.isLoadingVariable.asObservable()
    }
    
    var isOffline: Observable<Bool> {
        return self.isOfflineVariable.asObservable()
    }
    var keywordObserver: AnyObserver<String> {
        return keywordSubject.asObserver()
    }
    var error: Observable<Error> {
        return self.errorSubject.asObservable()
    }
    // Input
    private let photoVariable = Variable<[PhotoDetailList]>([])
    private let isLoadingVariable = Variable(false)
    private let isOfflineVariable = Variable(false)
    private let errorSubject = PublishSubject<Error>()
    private let keywordSubject = PublishSubject<String>()
    private let disposeBag: DisposeBag
    
    init(disposeBag: DisposeBag) {
        self.disposeBag = disposeBag
        bindObservableToGetPhoto()
    }
}

extension HomeViewModel {
    
    // MARK: Public
    func bindObservableToGetPhoto() {
       keywordSubject.asObservable()
        .do(onNext: {_ in SVProgressHUD.Photo.show() })
        .debounce(1.0, scheduler: MainScheduler.instance)
        .flatMap { (keyword) -> Observable<[PhotoDetailList]> in
            print("bind keyword", keyword)
            return self.getPhoto(with: keyword)
        }.do(onNext: { _ in SVProgressHUD.dismiss() })
        .bind(to: photoVariable)
        .disposed(by: disposeBag)
        
    }
    
    // MARK: Private
    private func getPhoto(with keyword: String) -> Observable<[PhotoDetailList]> {
     
        guard !keyword.isEmpty && keyword.count > 2 else {
            return .just([])
        }
        
        return PhotoModel()
            .getPhoto(with: keyword)
            .catchErrorJustReturn([])
    }
}
