//
//  NavigationView.swift
//  SnapChatCL
//
//  Created by Morshed Alam on 13/9/18.
//  Copyright © 2018 Morshed Alam. All rights reserved.
//

import UIKit

protocol NavigationDelegate {
    func animateButtonClick(tag:Int)
}

class NavigationView: UIView {
    
    //MARK: cameraView Property
    
    lazy var navBarView:NavBarView = {
        let view = NavBarView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .white
        return view
    }()
    
    //MARK: cameraView Property
    
    private lazy var cameraButtonView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.animateButtonClick(_:)))
        view.tag = 1
        view.addGestureRecognizer(tap)
        view.tintColor = .white
        return view
    }()
    
     lazy var cameraBtnGrayImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.image = #imageLiteral(resourceName: "cameraicon")
        imageView.tintColor = .lightGray
        imageView.isOpaque = false
        return imageView
    }()
    
     lazy var cameraBtnWhiteImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.image = #imageLiteral(resourceName: "cameraicon")
        imageView.tintColor = .white
        imageView.isOpaque = true
        return imageView
    }()
    
    // MARK: ChatIconView Property
    
    private lazy var chatIconView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.animateButtonClick(_:)))
        view.addGestureRecognizer(tap)
        view.tag = 2
        return view
    }()
    
     lazy var chatIconGrayImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .lightGray
        imageView.image = #imageLiteral(resourceName: "chaticon")
        return imageView
    }()
    
    
     lazy var chatIconWhiteImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.image = #imageLiteral(resourceName: "chaticon")
        return imageView
    }()
    
    // MARK: Discover Property
    
    private lazy var discoverIconView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.animateButtonClick(_:)))
        view.addGestureRecognizer(tap)
        view.tag = 3
        return view
    }()
    
     lazy var discoverIconGrayImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .lightGray
        imageView.image = #imageLiteral(resourceName: "discovericon")
        return imageView
    }()
    
     lazy var discoverIconWhiteImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.image = #imageLiteral(resourceName: "discovericon")
        return imageView
    }()
    
     lazy var indicator:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    
    // MARK: - Properties
    lazy var cameraButtonWidthConstraintConstant: CGFloat = {
        return self.cameraButtonWidthConstraint.constant
    }()
    lazy var cameraButtonBottomConstraintConstant: CGFloat = {
        return self.cameraButtonBottomConstraint.constant
    }()
    lazy var chatIconWidthConstraintConstant: CGFloat = {
        return self.chatIconWidthConstraint.constant
    }()
    lazy var chatIconBottomConstraintConstant: CGFloat = {
        return self.chatIconBottomConstraint.constant
    }()
    lazy var chatIconHorizontalConstraintConstant: CGFloat = {
        return self.chatIconHorizontalConstraint.constant
    }()
    lazy var discoverIconHorizontalConstraintConstant: CGFloat = {
        return self.discoverIconHorizontalConstraint.constant
    }()
    lazy var indicatorTransform: CGAffineTransform = {
        return self.cameraButtonView.transform
    }()
    
    
    
    var cameraButtonWidthConstraint: NSLayoutConstraint!
    var cameraButtonBottomConstraint: NSLayoutConstraint!
    var chatIconWidthConstraint: NSLayoutConstraint!
    var chatIconBottomConstraint: NSLayoutConstraint!
    var chatIconHorizontalConstraint: NSLayoutConstraint!
    var discoverIconHorizontalConstraint: NSLayoutConstraint!
    
     var navigationDelegate:NavigationDelegate?
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        initUI()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Internal
    func shadow(layer: CALayer, color: UIColor) {
        layer.shadowColor = color.cgColor
        layer.masksToBounds = false
        layer.shadowOffset = .zero
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.5
    }
    
    func setup() {
        shadow(layer: cameraBtnWhiteImageView.layer, color: .black)
        shadow(layer: chatIconWhiteImageView.layer, color: .darkGray)
        shadow(layer: discoverIconWhiteImageView.layer, color: .darkGray)
    }
   
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        return view == self ? nil : view
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        indicator.layer.cornerRadius = indicator.bounds.height / 2
        
    }
    
    private func initUI(){
        
       self.addSubview(navBarView)
        
        self.addSubview(cameraButtonView)
        cameraButtonView.addSubview(cameraBtnGrayImageView)
        cameraButtonView.addSubview(cameraBtnWhiteImageView)
        

        self.addSubview(chatIconView)
        chatIconView.addSubview(chatIconGrayImageView)
        chatIconView.addSubview(chatIconWhiteImageView)
        
//
        self.addSubview(discoverIconView)
        discoverIconView.addSubview(discoverIconGrayImageView)
        discoverIconView.addSubview(discoverIconWhiteImageView)
        

        self.addSubview(indicator)

        navBarView.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        navBarView.leftAnchor.constraint(equalTo: self.safeLeftAnchor).isActive = true
        navBarView.rightAnchor.constraint(equalTo:self.safeRightAnchor).isActive = true
        navBarView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        //camera
        cameraButtonView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cameraButtonWidthConstraint = cameraButtonView.widthAnchor.constraint(equalToConstant: 80)
        cameraButtonWidthConstraint.isActive = true
        cameraButtonView.heightAnchor.constraint(equalTo: cameraButtonView.widthAnchor).isActive = true
        cameraButtonBottomConstraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: cameraButtonView, attribute: .bottom, multiplier: 1, constant: 72)
        self.addConstraint(cameraButtonBottomConstraint)

        
        cameraBtnGrayImageView.topAnchor.constraint(equalTo:cameraButtonView.topAnchor).isActive = true
        cameraBtnGrayImageView.leftAnchor.constraint(equalTo: cameraButtonView.leftAnchor).isActive = true
        cameraBtnGrayImageView.rightAnchor.constraint(equalTo:cameraButtonView.rightAnchor).isActive = true
        cameraBtnGrayImageView.bottomAnchor.constraint(equalTo: cameraButtonView.bottomAnchor).isActive = true

        cameraBtnWhiteImageView.topAnchor.constraint(equalTo:cameraButtonView.topAnchor).isActive = true
        cameraBtnWhiteImageView.leftAnchor.constraint(equalTo: cameraButtonView.leftAnchor).isActive = true
        cameraBtnWhiteImageView.rightAnchor.constraint(equalTo:cameraButtonView.rightAnchor).isActive = true
        cameraBtnWhiteImageView.bottomAnchor.constraint(equalTo: cameraButtonView.bottomAnchor).isActive = true

//        //chat
        
      chatIconHorizontalConstraint = NSLayoutConstraint(item: chatIconView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier:0.2, constant: 0)
        self.addConstraint(chatIconHorizontalConstraint)
        chatIconWidthConstraint = chatIconView.widthAnchor.constraint(equalToConstant: 44)
        chatIconWidthConstraint.isActive = true
        chatIconView.heightAnchor.constraint(equalTo: chatIconView.widthAnchor).isActive = true
       //chatIconBottomConstraint = chatIconView.bottomAnchor.constraint(equalTo: self.safeBottomAnchor, constant: -34)
        chatIconBottomConstraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: chatIconView, attribute: .bottom, multiplier: 1, constant: 34)
        self.addConstraint(chatIconBottomConstraint)

        chatIconGrayImageView.centerXAnchor.constraint(equalTo: chatIconView.centerXAnchor).isActive = true
        chatIconGrayImageView.centerYAnchor.constraint(equalTo: chatIconView.centerYAnchor, constant: 7).isActive = true
        chatIconGrayImageView.heightAnchor.constraint(equalTo: chatIconView.heightAnchor, constant: -14).isActive = true
        chatIconGrayImageView.widthAnchor.constraint(equalTo: chatIconView.widthAnchor, constant: -14).isActive = true

        chatIconWhiteImageView.centerXAnchor.constraint(equalTo: chatIconView.centerXAnchor).isActive = true
        chatIconWhiteImageView.centerYAnchor.constraint(equalTo: chatIconView.centerYAnchor, constant: 7).isActive = true
        chatIconWhiteImageView.heightAnchor.constraint(equalTo: chatIconView.heightAnchor, constant: -14).isActive = true
        chatIconWhiteImageView.widthAnchor.constraint(equalTo: chatIconView.widthAnchor, constant: -14).isActive = true


//        //discover
        discoverIconView.topAnchor.constraint(equalTo: chatIconView.topAnchor).isActive = true
        discoverIconView.widthAnchor.constraint(equalTo: chatIconView.widthAnchor).isActive = true
        discoverIconView.heightAnchor.constraint(equalTo: discoverIconView.widthAnchor).isActive = true
        discoverIconHorizontalConstraint = NSLayoutConstraint(item: discoverIconView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.79, constant: 0)
        self.addConstraint(discoverIconHorizontalConstraint)
        
        discoverIconGrayImageView.centerXAnchor.constraint(equalTo: discoverIconView.centerXAnchor).isActive = true
        discoverIconGrayImageView.centerYAnchor.constraint(equalTo: discoverIconView.centerYAnchor, constant: 7).isActive = true
        discoverIconGrayImageView.heightAnchor.constraint(equalTo: discoverIconView.heightAnchor, constant: -14).isActive = true
        discoverIconGrayImageView.widthAnchor.constraint(equalTo: discoverIconView.widthAnchor, constant: -14).isActive = true

        discoverIconWhiteImageView.centerXAnchor.constraint(equalTo: discoverIconView.centerXAnchor).isActive = true
        discoverIconWhiteImageView.centerYAnchor.constraint(equalTo: discoverIconView.centerYAnchor, constant: 7).isActive = true
        discoverIconWhiteImageView.heightAnchor.constraint(equalTo: discoverIconView.heightAnchor, constant: -14).isActive = true
        discoverIconWhiteImageView.widthAnchor.constraint(equalTo: discoverIconView.widthAnchor, constant: -14).isActive = true

//        // indicator
        indicator.bottomAnchor.constraint(equalTo: self.safeBottomAnchor, constant: -10).isActive = true
        indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        indicator.widthAnchor.constraint(equalToConstant:46).isActive = true
        indicator.heightAnchor.constraint(equalToConstant:4).isActive = true
        
    }
    
    @objc func animateButtonClick(_ recognizer: UIGestureRecognizer){
        guard  let view = recognizer.view else { return }
        navigationDelegate?.animateButtonClick(tag: view.tag)
        
    }
    
    func setNavigationTitle(to controller: UIViewController?, percent:CGFloat){
        let offset = abs(percent)
        if let controller = controller as? TitleLabel {
            navBarView.animateNavBar(title: controller.navTitle, offset: offset)
        }
    }
    
    func animate(to controller: UIViewController?, percent: CGFloat, colorView:UIView) {
        let offset = abs(percent)
//
//        print(cameraBtnWhiteImageView.alpha)
//        print(cameraBtnGrayImageView.alpha)
//        print(offset)

        
        // fade white to gray
        
        
        animateIconColor(offset: offset)
        animateIconPosition(offset: offset)
        animateIconScale(offset: offset)
        animateIconCenter(offset: offset)
        animateBottomBar(percent: percent)

        // Background color view
        if let controller = controller as? ColoredView {
            colorView.backgroundColor = controller.controllerColor
        }

        // animation starts at 0.2 of the way across
        // and is fully faded in at 0.8
        var colorOffset = (offset - 0.2) / (0.8 - 0.2)
        colorOffset = min(max(colorOffset, 0), 1)
        colorView.alpha = colorOffset

        layoutIfNeeded()
    }
    
}


