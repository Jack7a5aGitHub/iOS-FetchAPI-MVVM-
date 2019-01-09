//
//  PhotoModel.swift
//  iOS-FetchAPI(MVVM)
//
//  Created by Jack Wong on 2019/01/07.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import Alamofire
import RxSwift
import Foundation

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

struct PhotoList {
    
    var photoId: Int
    var photoTitle: String
    var imageUrl: String
    
}

struct PhotoModel {
    
    private let baseURL = EndPoint.getPhoto.path
    
    func getPhoto(with keyword: String) -> Observable<[PhotoDetailList]> {
        return Observable.create { subscriber in
            let requestParameter = GetPhotoParameter(keyword: keyword)
            let router = Router.getPhoto(requestParameter: requestParameter)
           let request = APIClient.request(router: router, completionHandler: { response in
             let decoder = JSONDecoder()
                switch response {
                case .success(let result):
                    guard let data = result else {
                        fatalError()
                    }
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let fetchResult = try? decoder.decode(SearchInfo.self, from: data)
                    let photoDetailList = fetchResult?.info.photo
                    guard let photo = photoDetailList else {
                        subscriber.onNext([])
                        subscriber.onCompleted()
                        return
                    }
                    
                    subscriber.onNext(photo)
                    subscriber.onCompleted()
                case .failure(let error):
                    LogHelper.log("error_code: \((error as NSError).code)")
                    LogHelper.log("error_description: \((error as NSError).description)")
                }
            })
            
//            let url = self.baseURL
//            let request = Alamofire.request(url, parameters: ["q": keyword])
//                .validate(statusCode: 200..<300)
//                .responseData { response in
//                    subscriber.onNext(response.data)
//                    subscriber.onCompleted()
//            }
        
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
