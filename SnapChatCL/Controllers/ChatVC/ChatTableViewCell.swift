//
//  ChatTableViewCell.swift
//  SnapChatCL
//
//  Created by Morshed Alam on 15/9/18.
//  Copyright © 2018 Morshed Alam. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
   static let identifier = "ChatTableViewCell"
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.random
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontSizeToFitWidth = false
        label.text = "Loser Seeker"
        return label
    }()
    
    private lazy var profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "profile").withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor.random
        return imageView
    }()
    private lazy var shotDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 8)
        label.textColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontSizeToFitWidth = false
        label.text = "2 Missed Call"
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func initUI(){
        
      self.addSubview(nameLabel)
      self.addSubview(profileImageView)
      self.addSubview(shotDescriptionLabel)
      
        self.profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        self.profileImageView.rightAnchor.constraint(equalTo: self.nameLabel.leftAnchor, constant: -16).isActive = true
        self.profileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.profileImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.profileImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.nameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        self.nameLabel.topAnchor.constraint(equalTo: self.profileImageView.topAnchor).isActive = true
        
        self.shotDescriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        self.shotDescriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:-4).isActive = true
        self.shotDescriptionLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        self.shotDescriptionLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
}
