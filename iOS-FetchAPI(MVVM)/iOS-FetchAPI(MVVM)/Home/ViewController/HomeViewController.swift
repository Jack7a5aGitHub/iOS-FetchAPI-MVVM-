//
//  HomeViewController.swift
//  iOS-FetchAPI(MVVM)
//
//  Created by Jack Wong on 2019/01/05.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import AVFoundation
import SVProgressHUD

final class HomeViewController: UIViewController {

    @IBOutlet private var searchBar: UISearchBar!
    @IBOutlet private var photoCollectionView: UICollectionView!
    private let loadingView = UIActivityIndicatorView(style: .gray)
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let viewModel = HomeViewModel(disposeBag: disposeBag)
    }

}

extension HomeViewController {
    
    // MARK: Private
    private func bindKeyword(to viewModel: HomeViewModel) {
            searchBar.rx
                     .text
                .asObservable()
                .flatMap { inputText -> Observable<String> in
                    self.getString(text: inputText!)
        }.bind(to: viewModel.keywordObserver).disposed(by: disposeBag)
      
    }
    private func getString(text: String) -> Observable<String> {
        return Observable.just(text)
    }

}
