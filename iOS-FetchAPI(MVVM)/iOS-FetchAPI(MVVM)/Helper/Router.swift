//
//  Router.swift
//  iOS-FetchAPI(MVVM)
//
//  Created by Jack Wong on 2019/01/07.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible {
    
    static let baseURLString =  "https://api.photozou.jp"
    
    case getPhoto(requestParameter: GetPhotoParameter)
    
    func asURLRequest() throws -> URLRequest {
        let (method, path, body, parameter, header):
            (HTTPMethod, String, [String: Any], [String: Any], [String: String])
            = {
                
                switch self {
                    
                case .getPhoto(let requestParameter):
                    return (requestParameter.httpMethod, requestParameter.path, requestParameter.body,
                            requestParameter.parameter, requestParameter.header)
                    
                }
        }()
        
        if let url = URL(string: Router.baseURLString) {
            var urlRequest = URLRequest(url: url.appendingPathComponent(path))
            
            urlRequest.httpMethod = method.rawValue
            urlRequest.allHTTPHeaderFields = header
            urlRequest.timeoutInterval = 30
            if body.isEmpty {
                LogHelper.log("\n👆👆👆\nRequestURL:\(urlRequest.url?.absoluteString ?? "")" +
                    "\nRequestHeader: \(header.prettyPrintedJsonString))" +
                    "\nRequestParameter: \(parameter.prettyPrintedJsonString)")
                return try Alamofire.URLEncoding.default.encode(urlRequest, with: parameter)
                
            }
            
            let json = try? JSONSerialization.data(withJSONObject: body)
            urlRequest.httpBody = json
            
            LogHelper.log("\n👆👆👆\nRequestURL:\(urlRequest.url?.absoluteString ?? "")" +
                "\nRequestHeader: \(header.prettyPrintedJsonString))" +
                "\nReqeustBody : \(body.prettyPrintedJsonString)" +
                "\nRequestParameter: \(parameter.prettyPrintedJsonString)")
            
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: nil)
        } else {
            fatalError("url is nil.")
        }
    }
}
