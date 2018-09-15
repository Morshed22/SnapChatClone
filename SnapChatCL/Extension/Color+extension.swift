//
//  Color+extension.swift
//  SnapChatCL
//
//  Created by Morshed Alam on 15/9/18.
//  Copyright © 2018 Morshed Alam. All rights reserved.
//

import UIKit

extension CGFloat {
    static var random: CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random, green: .random, blue: .random, alpha: 1.0)
    }
}
