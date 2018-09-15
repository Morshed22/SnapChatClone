//
//  ChatVC.swift
//  SnapChatCL
//
//  Created by Morshed Alam on 14/9/18.
//  Copyright © 2018 Morshed Alam. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    // MARK: - Properties
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 50
        tableView.tableFooterView = UIView()
        tableView.separatorColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        tableView.separatorInset = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 0.0)
        tableView.contentOffset = .zero
        tableView.dataSource = self
       // tableView.delegate = self
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
        return tableView
    }()
    
    var controllerColor: UIColor = UIColor(red: 0.23, green: 0.66, blue: 0.96, alpha: 1.0)
    var navTitle: String = "Friends"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(backgroundView)
        backgroundView.addSubview(tableView)
        
        backgroundView.topAnchor.constraint(equalTo:view.topAnchor, constant:64).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: view.safeLeftAnchor).isActive = true
        backgroundView.rightAnchor.constraint(equalTo:view.safeRightAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant:40).isActive = true
        
        tableView.topAnchor.constraint(equalTo:backgroundView.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: backgroundView.safeLeftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo:backgroundView.safeRightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: backgroundView.safeBottomAnchor,constant:-40 ).isActive = true
        
        backgroundView.layer.cornerRadius = 20
        backgroundView.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
extension ChatVC:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier) as! ChatTableViewCell
    }
}
extension ChatVC: ColoredView, TitleLabel {}

