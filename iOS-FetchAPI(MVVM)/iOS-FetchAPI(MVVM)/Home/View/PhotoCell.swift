//
//  PhotoCell.swift
//  iOS-FetchAPI(MVVM)
//
//  Created by Jack Wong on 2019/01/07.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import Kingfisher
import UIKit

final class PhotoCell: UICollectionViewCell {

    // MARK: - IBOutlet
    @IBOutlet private var photoImageView: UIImageView!
    @IBOutlet private var photoTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    static var identifier: String {
        return self.className
    }
    static var nibName: String {
        return self.className
    }
    var imageUrl: String? {
        didSet {
            guard let imageUrl = imageUrl else {
                return
            }
            photoImageView.kf.setImage(with: URL(string: imageUrl))
        }
    }
    
    var title: String? {
        didSet {
            guard let title = title else {
                return
            }
            photoTitleLabel.setTextFontAndColor(text: title, fontSize: 14, color: .black)
        }
    }
    
}
