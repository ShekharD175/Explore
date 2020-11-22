//
//  UIKitExtension.swift
//  Explore
//
//  Created by Shekhar on 21/11/20.
//  Copyright © 2020 Shekhar. All rights reserved.
//

import UIKit
import Foundation

extension UIView {
    
    enum ViewSide {
        case Left, Right, Top, Bottom
    }
    
    func addBorder(toSide side: ViewSide, withColor color: CGColor, andThickness thickness: CGFloat) {
        
        let border = CALayer()
        border.backgroundColor = color
        switch side {
        case .Left: border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height); break
        case .Right: border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height); break
        case .Top: border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness); break
        case .Bottom: border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: thickness); break
        }
        
        layer.addSublayer(border)
    }
    
    func roundCorners() {
        self.clipsToBounds = true
        self.layoutIfNeeded()
        self.layer.cornerRadius = self.frame.size.height/2
    }
}
