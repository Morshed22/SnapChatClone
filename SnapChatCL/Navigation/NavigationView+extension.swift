//
//  NavigationView+extension.swift
//  SnapChatCL
//
//  Created by Morshed Alam on 14/9/18.
//  Copyright © 2018 Morshed Alam. All rights reserved.
//

import UIKit

// MARK: - Animations
extension NavigationView {
    
    func animateIconColor(offset: CGFloat) {

        cameraBtnWhiteImageView.alpha = 1 - offset
        cameraBtnGrayImageView.alpha = offset
        chatIconWhiteImageView.alpha = 1 - offset
        chatIconGrayImageView.alpha = offset
        discoverIconWhiteImageView.alpha = chatIconWhiteImageView.alpha
        discoverIconGrayImageView.alpha = chatIconGrayImageView.alpha
    }
    
    func animateIconPosition(offset: CGFloat) {
        // Line the controls up along the bottom
        let finalDistanceFromBottom: CGFloat = 25.0
        var distance = cameraButtonBottomConstraintConstant - finalDistanceFromBottom
        cameraButtonBottomConstraint.constant = cameraButtonBottomConstraintConstant - (distance * offset)
        distance = chatIconBottomConstraintConstant - finalDistanceFromBottom
        chatIconBottomConstraint.constant = chatIconBottomConstraintConstant - (distance * offset)
    }
    
    func animateIconScale(offset: CGFloat) {
        // Scale the controls using width constraints
        let finalWidthScale: CGFloat = cameraButtonWidthConstraintConstant * 0.2
        cameraButtonWidthConstraint.constant = cameraButtonWidthConstraintConstant - (finalWidthScale * offset)
        let scale = chatIconWidthConstraintConstant * 0.2
        chatIconWidthConstraint.constant = chatIconWidthConstraintConstant - (scale * offset)
    }
    
    func animateIconCenter(offset: CGFloat) {
      
        
       // print(chatIconHorizontalConstraint.multiplier, discoverIconHorizontalConstraint.multiplier)
        
        let originalMultiplier = chatIconHorizontalConstraint.multiplier * bounds.width * 0.5
        let newMultiplier = (bounds.width * 0.54 * 0.5) - originalMultiplier
        chatIconHorizontalConstraint.constant = newMultiplier * offset
        discoverIconHorizontalConstraint.constant = -newMultiplier * offset
    }
    
    func animateBottomBar(percent: CGFloat) {
        // Controller Indicator Line
        let offset = abs(percent)
        let scaleTransform = CGAffineTransform(scaleX: offset, y: 1)
        let distance = 0.23 * bounds.width
        
        // use percent as it has the correct sign
        let transform = indicatorTransform.translatedBy(x: distance * percent, y: 0)
        indicator.transform = transform.concatenating(scaleTransform)
        indicator.alpha = offset
    }
    
}
