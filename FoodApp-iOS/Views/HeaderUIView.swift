//
//  HeaderUIView.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-01-26.
//

import UIKit

class HeaderUIView: UIView {

    private let homeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "HomeImage")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(homeImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        homeImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
