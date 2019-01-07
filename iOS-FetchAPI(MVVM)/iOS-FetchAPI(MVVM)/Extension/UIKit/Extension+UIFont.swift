//
//  Extension+UIFont.swift
//  iOS-FetchAPI(MVVM)
//
//  Created by Jack Wong on 2019/01/07.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import UIKit

extension UIFont {
    
    class func systemFontOfSize(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Helvetica", size: size) else {
            fatalError("No Font found")
        }
        return font
    }
    
    func lightSystemFontOfSize(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "CustomFont-Light", size: size) else {
            fatalError("no Font found")
        }
        return font
    }
    
    class func boldSystemFontOfSize(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Helvetica Bold", size: size) else {
            fatalError("No Font found")
        }
        return font
    }
}

