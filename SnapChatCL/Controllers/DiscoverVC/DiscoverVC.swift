//
//  DiscoverVC.swift
//  SnapChatCL
//
//  Created by Morshed Alam on 14/9/18.
//  Copyright © 2018 Morshed Alam. All rights reserved.
//

import UIKit

class DiscoverVC: UIViewController {
    
    
    private let nuberPerRow = 2
    var controllerColor: UIColor = UIColor(red: 0.59, green: 0.23, blue: 0.96, alpha: 1.0)
    var navTitle: String = "Discover"
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var collectionView:UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 5, bottom: 20, right: 5)
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 5
        let totalSpace = layout.sectionInset.left
            + layout.sectionInset.right
            + (layout.minimumInteritemSpacing * CGFloat(nuberPerRow - 1))
        let itemWidth = CGFloat((view.bounds.width - totalSpace) / CGFloat(nuberPerRow))
        layout.itemSize = CGSize(width: itemWidth , height: itemWidth)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(DiscoverCollectionViewCell.self, forCellWithReuseIdentifier: DiscoverCollectionViewCell.identifier)
        collectionView.dataSource = self
        return collectionView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initUI()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func initUI(){
        
        self.view.addSubview(backgroundView)
        backgroundView.addSubview(collectionView)
        
        backgroundView.topAnchor.constraint(equalTo:view.topAnchor, constant:64).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: view.safeLeftAnchor).isActive = true
        backgroundView.rightAnchor.constraint(equalTo:view.safeRightAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant:40).isActive = true
        
        collectionView.topAnchor.constraint(equalTo:backgroundView.safeTopAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: backgroundView.safeLeftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo:backgroundView.safeRightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: backgroundView.safeBottomAnchor,constant:-40 ).isActive = true
        
        backgroundView.layer.cornerRadius = 20
        backgroundView.layer.masksToBounds = true
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
}
extension DiscoverVC:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverCollectionViewCell.identifier, for: indexPath) as! DiscoverCollectionViewCell
    }
    
}

extension DiscoverVC: ColoredView, TitleLabel {}
