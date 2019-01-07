//
//  Dictionary+JSON.swift
//  iOS-FetchAPI(MVVM)
//
//  Created by Jack Wong on 2019/01/07.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import Foundation

extension Dictionary {
    var prettyPrintedJsonString: String {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted])
            return String(bytes: jsonData, encoding: .utf8) ?? "変換失敗"
        } catch {
            return "変換失敗"
        }
    }
}
