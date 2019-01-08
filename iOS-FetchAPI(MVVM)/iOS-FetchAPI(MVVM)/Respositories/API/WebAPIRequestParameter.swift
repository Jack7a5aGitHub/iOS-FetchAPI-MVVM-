//
//  WebAPIRequestParameter.swift
//  iOS-FetchAPI(MVVM)
//
//  Created by Jack Wong on 2019/01/07.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import Foundation

final class WebAPIRequestParameter: WebAPIRequestParameterProtocol {
    
    var requestParameter: WebAPIRequestParameterProtocol
    
    init(_ requestParameter: WebAPIRequestParameterProtocol) {
        self.requestParameter = requestParameter
    }
}
