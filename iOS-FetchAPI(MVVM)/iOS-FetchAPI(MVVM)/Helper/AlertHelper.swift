//
//  AlertHelper.swift
//  iOS-FetchAPI(MVVM)
//
//  Created by Jack Wong on 2019/01/07.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import UIKit

final class AlertHelper {
    
    static func buildAlert(title: String = "",
                           message: String,
                           rightButtonTitle: String = "ALERT_OK".localized(),
                           leftButtonTitle: String? = nil,
                           rightButtonAction: ((UIAlertAction) -> Void)? = nil,
                           leftButtonAction: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let positiveAction = UIAlertAction(title: rightButtonTitle, style: .default, handler: rightButtonAction)
        
        if let leftButtonTitle = leftButtonTitle {
            let negativeAction = UIAlertAction(title: leftButtonTitle, style: .default, handler: leftButtonAction)
            alert.addAction(negativeAction)
        }
        alert.addAction(positiveAction)
        return alert
    }
    
}
