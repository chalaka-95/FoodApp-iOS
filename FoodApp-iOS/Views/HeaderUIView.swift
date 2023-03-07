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
    
    private let titleLable: UILabel = {
        let label = UILabel()
        label.text = ("Recipes & Nutrition")
        label.textAlignment = .center
        label.textColor = .systemBackground
        label.shadowColor = UIColor.blue
        label.shadowOffset = CGSize(width: 2, height: 2)
        label.font = UIFont(name: "Hoefler", size: CGFloat(36))
        
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(homeImageView)
        //addGradient()
        homeImageView.addSubview(titleLable)
        titleLable.leadingAnchor.constraint(equalTo: homeImageView.leadingAnchor, constant: 10).isActive = true
        //titleLable.trailingAnchor.constraint(equalTo: homeImageView.trailingAnchor, constant: -20).isActive = true
        titleLable.bottomAnchor.constraint(equalTo: homeImageView.bottomAnchor, constant: -20).isActive = true
        //titleLable.centerXAnchor.constraint(equalTo: homeImageView.centerXAnchor).isActive = true
        //titleLable.centerYAnchor.constraint(equalTo: homeImageView.centerYAnchor, constant: -40).isActive = true
    }
    
    private func addGradient() {
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [
                UIColor.clear.cgColor,
                UIColor.systemBackground.cgColor
            ]
            gradientLayer.frame = bounds
            layer.addSublayer(gradientLayer)
        }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        homeImageView.frame = bounds
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
