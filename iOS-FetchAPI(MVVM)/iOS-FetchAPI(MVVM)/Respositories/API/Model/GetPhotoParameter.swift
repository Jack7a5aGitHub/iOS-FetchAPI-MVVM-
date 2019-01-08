//
//  GetPhotoParameter.swift
//  iOS-FetchAPI(MVVM)
//
//  Created by Jack Wong on 2019/01/07.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import Alamofire

final class GetPhotoParameter: WebAPIRequestParameterProtocol {
    
    var path = EndPoint.getPhoto.path
    var httpMethod = HTTPMethod.get
    var parameter: [String: Any] = [:]
    var header = [
        "Content-Type": "application/json"
    ]
    ///　初期化
    ///
    init() {
    }
    
    /// 初期化
    ///
    /// - Parameter groupId: サービスグループID
    /// - グループデバイス一覧取得
    init(keyword: String) {
        parameter = ["keyword": keyword]
    }
    
}
