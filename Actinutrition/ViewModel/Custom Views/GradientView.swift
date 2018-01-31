//
//  GradientView.swift
//  Actinutrition
//
//  Created by Elaine Reyes on 1/16/18.
//  Copyright © 2018 HAPILABS LIMITED. All rights reserved.
//

import UIKit

class GradientView: UIView
{
    // MARK: - View Management
    
    override open class var layerClass: AnyClass
    {
        return CAGradientLayer.classForCoder()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        let gradientLayer = self.layer as! CAGradientLayer
        gradientLayer.colors = [UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor, UIColor.init(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0).cgColor]
        
        gradientLayer.startPoint = CGPoint.zero
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 1)
    }
}
