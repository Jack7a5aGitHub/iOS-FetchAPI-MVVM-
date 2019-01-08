//
//  EndPoint.swift
//  iOS-FetchAPI(MVVM)
//
//  Created by Jack Wong on 2019/01/07.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import Foundation

let api = "rest"

enum EndPoint {
    
    case getPhoto
    
    var path: String {
        switch self {
        case .getPhoto:
            return "/\(api)/search_public.json"
        }
    }
}
