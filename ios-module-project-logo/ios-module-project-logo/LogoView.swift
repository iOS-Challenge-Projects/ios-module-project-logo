//
//  LogoView.swift
//  ios-module-project-logo
//
//  Created by FGT MAC on 2/15/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import UIKit

class LogoView: UIView {

 
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        print("Drawing")
        
        guard let currentContext = UIGraphicsGetCurrentContext() else{ return}
        
        drawLogo(user: currentContext)
    }
 
    func drawLogo(user context: CGContext) {
        //Make of type CGFLoat to prevent having to convert later
        let x: CGRect

        context.addEllipse(in: rect)
        context.setFillColor(clockBgColor.cgColor)
        context.fillPath()
        
        
        
        
        setNeedsDisplay()
    }

}
