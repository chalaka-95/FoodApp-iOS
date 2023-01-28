//
//  CustomGradian.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-01-28.
//

import UIKit

class CustomeGradient:UIView {
    override init(frame: CGRect){
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let layer = self.layer as? CAGradientLayer{
            layer.colors = [UIColor.blue.cgColor, UIColor.gray.cgColor]
            layer.locations = [0.0,1.2]
        }
    }
    
    override class var layerClass: AnyClass{
        return CAGradientLayer.self
    }
    
    required init?(coder aDecoder:NSCoder){
        fatalError("init has not been implement")
    }
}
