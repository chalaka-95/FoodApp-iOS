//
//  FoodTableViewCell.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-02-02.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    
    static let identifier = "FoodTableViewCell"
    
    private let foodTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let foodImageUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(foodImageUIImageView)
        contentView.addSubview(foodTitleLabel)
        applyConstraints()
        
    }
    
    
    private func applyConstraints() {
        let foodImageUIImageViewConstraints = [
            foodImageUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            foodImageUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            foodImageUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            foodImageUIImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let foodTitleLabelConstraints = [
            foodTitleLabel.leadingAnchor.constraint(equalTo: foodImageUIImageView.trailingAnchor, constant: 20),
            foodTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ]
        
        NSLayoutConstraint.activate(foodImageUIImageViewConstraints)
        NSLayoutConstraint.activate(foodTitleLabelConstraints)
    }
    
    
    
    public func config(with model: FoodViewModel) {

        guard let url = URL(string: "\(model.imageURL)") else {
            return
        }
        foodImageUIImageView.sd_setImage(with: url, completed: nil)
        foodTitleLabel.text = model.foodName
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}

