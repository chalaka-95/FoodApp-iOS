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
    
    private let Label: UILabel = {
             let Label = UILabel()
             Label.text = "Recipes & Nutrition"
             Label.textAlignment = .center
             Label.textColor = .black
             Label.shadowColor = UIColor.black
             Label.shadowOffset = CGSize(width: 2, height: 2)
             Label.font = UIFont(name: "Hoefler", size: CGFloat(36))
             
             Label.font = .systemFont(ofSize: 36, weight: .bold)
             Label.translatesAutoresizingMaskIntoConstraints = false
            return Label
         }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(homeImageView)
        addGradient()
        homeImageView.addSubview(Label)
                Label.centerXAnchor.constraint(equalTo: homeImageView.centerXAnchor).isActive = true
                Label.centerYAnchor.constraint(equalTo: homeImageView.centerYAnchor, constant: -40).isActive = true
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
