//
//  CustomHeaderView.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-01-29.
//

import UIKit

class customHeaderView:UIView{
    
    let bg = CustomeGradient()
    
    init(frame: CGRect = .zero, title:String = "Header Title", subtitle:String = "Header Subtitle"){
        super.init(frame: frame)
        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false
        }
        setupUI()
    }
    
    func setupUI(){
        addSubview(bg)
        setupConstraint()
    }
    
    func setupConstraint(){
        bg.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder:NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
