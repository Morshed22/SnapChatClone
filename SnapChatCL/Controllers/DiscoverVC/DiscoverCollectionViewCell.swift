//
//  DiscoverCollectionViewCell.swift
//  SnapChatCL
//
//  Created by Morshed Alam on 14/9/18.
//  Copyright © 2018 Morshed Alam. All rights reserved.
//

import UIKit

class DiscoverCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DiscoverCollectionViewCell"
    
    
    var imageView:UIImageView! = nil
    
    
   func commonInit(){
    if imageView == nil{
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "freddie_mercury")
        let  views = ["imageView": imageView!]
        addSubview(imageView)
        addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[imageView]-0-|", options: .alignAllCenterY, metrics: nil, views:views))
        
        addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[imageView]-0-|", options: .alignAllCenterX, metrics: nil, views:views))
        
    }
}
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView = nil
    }
}
