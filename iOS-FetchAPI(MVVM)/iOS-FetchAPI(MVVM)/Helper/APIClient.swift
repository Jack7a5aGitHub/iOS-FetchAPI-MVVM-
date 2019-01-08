//
//  APIClient.swift
//  iOS-FetchAPI(MVVM)
//
//  Created by Jack Wong on 2019/01/07.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import Alamofire
import RxSwift
import UIKit

enum Result {
    case success(Data?)
    case failure(Error)
}

enum HTTPStatusCode: Int {
    case success = 200
    case redirection = 300
    case clientErrors = 400
    case unauthorized = 401
    case serverErrors = 500
    case serviceUnavailable = 503
}

final class APIClient {
    
    /// 端末の通信状態を取得
    ///
    /// - Returns: true: オンライン, false: オフライン
    static func isReachable() -> Bool {
        
        if let reachabilityManager = NetworkReachabilityManager() {
            reachabilityManager.startListening()
            return reachabilityManager.isReachable
        }
        return false
    }
    
    /// API Request
    static func request(router: Router,
                        completionHandler: @escaping (Result) -> Void = { _ in }) -> DataRequest {
        let request = Alamofire.request(router).responseJSON { response in
            guard let statusCode = response.response?.statusCode else {
                print("no status Code")
                // api request timeout 処理
                if let error = response.result.error {
                    completionHandler(Result.failure(error))
                }
                return
            }
            var responseJson = ""
            if let json = response.result.value as? [String: Any] {
                responseJson = json.prettyPrintedJsonString
            } else {
                
                if let jsonArray = response.result.value as? [[String: Any]] {
                    
                    for json in jsonArray {
                        responseJson += json.prettyPrintedJsonString
                    }
                }
            }
            switch response.result {
            case .success:
                switch statusCode {
                case HTTPStatusCode.success.rawValue:
                    LogHelper.log("\n👇👇👇" +
                        "\nStatusCode: \(statusCode)\nResponseBody: \(responseJson)")
                    completionHandler(Result.success(response.data))
                    return
                default:
                    return
                }
            case .failure:
                LogHelper.log("\n🔻🔻🔻" +
                    "\nStatusCode: \(statusCode)\nResponseBody: \(responseJson)")
                
                if let error = response.result.error {
                    completionHandler(Result.failure(error))
                    return
                }
            }
        }
        return request
    }
    
}

