//
//  NavBarView.swift
//  SnapChatCL
//
//  Created by Morshed Alam on 15/9/18.
//  Copyright © 2018 Morshed Alam. All rights reserved.
//

import UIKit

class NavBarView: UIView {
    
    
    private lazy var profileIconView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "me")
        return imageView
    }()
    
    private lazy var searchIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "icon_search").withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .white
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .white
        
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    
    lazy var altTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .white
        label.text = "Search"
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateNavBar(title:String, offset:CGFloat){
        var colorOffset = (offset - 0.2) / (0.8 - 0.2)
        colorOffset = min(max(colorOffset, 0), 1)
        titleLabel.alpha = colorOffset
        altTitleLabel.alpha =  1  - min(max(offset*5, 0),1)
        titleLabel.text = title
    }
    
    
    func initUI(){
        self.addSubview(profileIconView)
        self.addSubview(searchIconView)
        self.addSubview(altTitleLabel)
        self.addSubview(titleLabel)
        
        profileIconView.leftAnchor.constraint(equalTo: self.leftAnchor, constant:16).isActive = true
        profileIconView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        profileIconView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        profileIconView.topAnchor.constraint(equalTo: self.safeTopAnchor).isActive = true
        
        searchIconView.leftAnchor.constraint(equalTo: profileIconView.rightAnchor, constant: 10).isActive = true
        searchIconView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        searchIconView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        searchIconView.topAnchor.constraint(equalTo: self.profileIconView.topAnchor, constant:10).isActive = true
        
        titleLabel.leftAnchor.constraint(equalTo: searchIconView.rightAnchor, constant: 10).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.profileIconView.topAnchor, constant:7).isActive = true
        
        altTitleLabel.leftAnchor.constraint(equalTo: searchIconView.rightAnchor, constant: 10).isActive = true
        altTitleLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        altTitleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        altTitleLabel.topAnchor.constraint(equalTo: self.profileIconView.topAnchor, constant:7).isActive = true
        
        
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    override func layoutSubviews() {
        super.layoutSubviews()
        profileIconView.layer.cornerRadius = profileIconView.bounds.width/2
        profileIconView.layer.masksToBounds = true
    }
    
    
}
