//
//  Extension+UILabel.swift
//  iOS-FetchAPI(MVVM)
//
//  Created by Jack Wong on 2019/01/07.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import UIKit

extension UILabel {
    
    func setBorder() {
        
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2.0
        self.layer.cornerRadius = 3.0
        self.layer.masksToBounds = true
        self.backgroundColor = .darkGray
    }
    
    func roundBorder() {
        layer.borderColor = UIColor.white.cgColor
        layer.masksToBounds = true
        layer.cornerRadius = 10.0
        layer.borderWidth = 1.0
    }
    func setRoundBackground() {
        backgroundColor = .white
        layer.borderColor = UIColor.white.cgColor
        layer.masksToBounds = true
        layer.cornerRadius = 10.0
    }
    
    func setMultiFontColor(labelText: String,
                           location: Int = 0,
                           length: Int = 0,
                           location2: Int = 0,
                           length2: Int = 0) {
        let attributeText = NSMutableAttributedString(string: labelText)
        attributeText.addAttribute(NSAttributedString.Key.foregroundColor,
                                   value: UIColor.red,
                                   range: NSRange(location: location, length: length))
        attributeText.addAttribute(NSAttributedString.Key.foregroundColor,
                                   value: UIColor.red,
                                   range: NSRange(location: location2, length: length2))
        self.attributedText = attributeText
    }
    
    func setBoldTextFontAndColor(text: String, fontSize size: CGFloat, color: UIColor) {
        self.text = text
        self.font = UIFont.boldSystemFontOfSize(size: size)
        self.textColor = color
    }
    func setTextFontAndColor(text: String, fontSize size: CGFloat, color: UIColor) {
        self.text = text
        self.font = UIFont.systemFontOfSize(size: size)
        self.textColor = color
    }
    func setUnderline(text: String, fontSize size: CGFloat, color: UIColor) {
        self.font = UIFont.systemFontOfSize(size: size)
        self.textColor = color
        let underlineAttribute = NSAttributedString(string: text,
                                                    attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        attributedText = underlineAttribute
    }
    
    func setAttributedTextAndFontWithAlignment(text: String,
                                               fontSize size: CGFloat,
                                               boldTextSize boldSize: CGFloat = 0,
                                               location: Int = 0,
                                               length: Int = 0,
                                               textAlignment: NSTextAlignment) {
        let attributeText = NSMutableAttributedString(string: text)
        attributeText.addAttribute(NSAttributedString.Key.font,
                                   value: UIFont.boldSystemFontOfSize(size: boldSize),
                                   range: NSRange(location: location, length: length))
        font = UIFont.systemFontOfSize(size: size)
        self.textAlignment = textAlignment
        attributedText = attributeText
    }
}
