//
//  MiddleWareVC.swift
//  SnapChatCL
//
//  Created by Morshed Alam on 14/9/18.
//  Copyright © 2018 Morshed Alam. All rights reserved.
//

import UIKit

class MiddleWareVC: UIViewController {
    
   var navTitle: String = "Search"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
extension MiddleWareVC: TitleLabel {}
