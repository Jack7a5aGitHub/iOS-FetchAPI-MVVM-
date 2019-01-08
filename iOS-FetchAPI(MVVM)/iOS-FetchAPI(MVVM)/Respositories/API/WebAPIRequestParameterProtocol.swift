
//
//  WebAPIRequestProtocol.swift
//  iOS-FetchAPI(MVVM)
//
//  Created by Jack Wong on 2019/01/07.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import Alamofire

protocol WebAPIRequestParameterProtocol: class {
}

extension WebAPIRequestParameterProtocol {
    
    var endPoint: String {
        return ""
    }
    
    var httpMethod: HTTPMethod {
        return .post
    }
    
    var path: String {
        return ""
    }
    
    var parameter: [String: String] {
        return [:]
    }
    
    var header: [String: String] {
        return [
            "Content-Type": "application/json"
        ]
    }
    
    var body: [String: String] {
        return [:]
    }
}
