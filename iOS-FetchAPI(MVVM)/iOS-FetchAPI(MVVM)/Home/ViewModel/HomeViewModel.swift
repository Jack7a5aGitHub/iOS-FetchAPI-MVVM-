//
//  HomeViewModel.swift
//  iOS-FetchAPI(MVVM)
//
//  Created by Jack Wong on 2019/01/06.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import Foundation
import RxSwift

struct HomeViewModel {
    
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
        .do(onNext: {_ in self.isLoadingVariable.value = true })
        .debounce(1.0, scheduler: MainScheduler.instance)
        .flatMap { (error) -> Observable<[PhotoDetailList]> in
            return self.getPhoto(with: nil)
        }.do(onNext: { _ in self.isLoadingVariable.value = false })
        .bind(to: photoVariable)
        .disposed(by: disposeBag)
        
    }
    
    // MARK: Private
    private func getPhoto(with keyword: String?) -> Observable<[PhotoDetailList]> {
        guard let keyword = keyword else {
            return .just([])
        }
        guard !keyword.isEmpty else {
            return .just([])
        }
        
        return PhotoModel()
            .getPhoto(with: keyword)
            .catchErrorJustReturn([])

    }
}
