//
//  ViewController.swift
//  SnapChatCL
//
//  Created by Morshed Alam on 13/9/18.
//  Copyright © 2018 Morshed Alam. All rights reserved.
//

import UIKit

protocol ColoredView {
    var controllerColor: UIColor { get set }
    
}
protocol TitleLabel {
    var navTitle:String{get set}
}

class MainVC: UIViewController {
    
    private lazy var cameraView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var navBarSeperatorView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        return view
    }()
    
    private lazy var colorView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var navigationView:NavigationView = {
        let view = NavigationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.navigationDelegate = self
        return view
    }()
    
    private lazy var containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var scrollVC :ScrollVC = {
        let scrollVC = ScrollVC()
        scrollVC.delegate = self
        return scrollVC
    }()
    
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.titleLabel?.text = "Animate"
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
    }()
    
    let cameraVC = CameraVC()
    let chatVC = ChatVC()
    let middleWareVC = MiddleWareVC()
    let discoverVC = DiscoverVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        configureCameraController()
        embededScollVC()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func initUI(){
        
        view.addSubview(cameraView)
        view.addSubview(colorView)
        view.addSubview(containerView)
        view.addSubview(navigationView)
        cameraView.addSubview(navBarSeperatorView)
        
        cameraView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        cameraView.leftAnchor.constraint(equalTo: view.safeLeftAnchor).isActive = true
        cameraView.rightAnchor.constraint(equalTo:view.safeRightAnchor).isActive = true
        cameraView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor).isActive = true
        
        navBarSeperatorView.topAnchor.constraint(equalTo:view.topAnchor,constant:64).isActive = true
        navBarSeperatorView.leftAnchor.constraint(equalTo: view.safeLeftAnchor).isActive = true
        navBarSeperatorView.rightAnchor.constraint(equalTo:view.safeRightAnchor).isActive = true
        navBarSeperatorView.heightAnchor.constraint(equalToConstant: 0.3).isActive = true
        
        
        //color
        colorView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        colorView.leftAnchor.constraint(equalTo: view.safeLeftAnchor).isActive = true
        colorView.rightAnchor.constraint(equalTo:view.safeRightAnchor).isActive = true
        colorView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor).isActive = true
        
        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.safeLeftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo:view.safeRightAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor).isActive = true
        
        navigationView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navigationView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        navigationView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        navigationView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor).isActive = true
    
    }
    private func embededScollVC(){
        self.addChildViewController(scrollVC)
        scrollVC.view.frame = self.view.bounds
        self.containerView.addSubview(scrollVC.view)
        self.scrollVC.didMove(toParentViewController: self)
    }
    private  func configureCameraController() {
        cameraVC.prepare {(error) in
            if let error = error {
                print(error)
            }
            try? self.cameraVC.displayPreview(on: self.cameraView)
        }
    }
    
}

extension MainVC:NavigationDelegate{
    func animateButtonClick(tag: Int) {
        switch tag {
        case 1:
            scrollVC.setController(to: middleWareVC, animated: true)
        case 2:
            scrollVC.setController(to: chatVC, animated: true)
        case 3:
            scrollVC.setController(to: discoverVC, animated: true)
        default:
            print("nothing")
        }
    }
}

extension MainVC:ScrollViewControllerDelegate{
    var viewControllers: [UIViewController?] {
        return [chatVC, middleWareVC, discoverVC]
    }
    
    var initialViewController: UIViewController {
        return middleWareVC
    }
    
    func scrollViewDidScroll() {
        // calculate percentage for animation
        let min: CGFloat = 0
        let max: CGFloat = scrollVC.pageSize.width
        let x = scrollVC.scrollView.contentOffset.x
        let result = ((x - min) / (max - min)) - 1
        var controller: UIViewController?
        if scrollVC.isControllerVisible(chatVC) {
            controller = chatVC
        }else if scrollVC.isControllerVisible(discoverVC) {
            controller = discoverVC
        }else{
            controller = middleWareVC
        }
        
        navigationView.animate(to: controller, percent: result, colorView: self.colorView)
        navigationView.setNavigationTitle(to: controller,  percent: result)
    }
    
    
}
