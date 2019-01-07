//
//  HomeViewModel.swift
//  iOS-FetchAPI(MVVM)
//
//  Created by Jack Wong on 2019/01/06.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import Foundation
import RxCocoa

struct SearchInfo: Decodable {
    let info: Photos
}

struct Photos: Decodable {
    let photoNum: Int
    let photo: [PhotoDetailList]?
}

struct PhotoDetailList: Decodable {
    let photoId: Int
    let photoTitle: String
    let imageUrl: String
    let originalImageUrl: String
    let thumbnailImageUrl: String
}

final class HomeViewModel: NSObject {
    private var photos = [PhotoList]()
    
    func getPhoto() {
        
    }
}
