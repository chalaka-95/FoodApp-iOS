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
            layer.colors = [UIColor.systemPurple.cgColor, UIColor.systemPink.cgColor]
            //An optional array of NSNumber objects defining the location of each gradient stop
            //layer.locations = [0.0,1.2]
            layer.startPoint = CGPoint(x: 1, y: 0.0)
            layer.endPoint = CGPoint(x: 0.5, y: 1.0)
        }
    }
    
    override class var layerClass: AnyClass{
        return CAGradientLayer.self
    }
    
    required init?(coder aDecoder:NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
