//
//  CustomLabel.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-01-29.
//

import UIKit

class CustomLabel:UILabel{
    init(title:String = "Default Text", color:UIColor = .white, size:CGFloat = 16, frame:CGRect = .zero){
        super.init(frame: frame)
        if frame == .zero{
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.text = title
        self.textColor = color
        self.font = UIFont.systemFont(ofSize: size)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
