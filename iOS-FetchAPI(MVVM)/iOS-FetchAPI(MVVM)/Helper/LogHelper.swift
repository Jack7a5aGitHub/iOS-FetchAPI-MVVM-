//
//  LogHelper.swift
//  iOS-FetchAPI(MVVM)
//
//  Created by Jack Wong on 2019/01/07.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import Foundation

final class LogHelper {
    
    static func log(_ body: String = "", function: String = #function, line: Int = #line) {
        #if AvatarInStaging
        print("[\(function): \(line)] \(body)")
        #endif
    }
    
    /// ログの表示
    ///
    /// - Parameter body: 表示内容
    static func log(_ body: String = "") {
        print(body)
    }
}

