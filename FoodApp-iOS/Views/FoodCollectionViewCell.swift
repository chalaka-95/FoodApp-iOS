//
//  TitleCollectionViewCell.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-01-31.
//

import UIKit
import SDWebImage

class FoodCollectionViewCell: UICollectionViewCell {
    static let identifier = "FoodCollectionViewCell"
    private let foodImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(foodImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        foodImageView.frame = contentView.bounds
    }
    
    public func config(with model: String){
        guard let url = URL(string: model) else { return }
        foodImageView.sd_setImage(with: url, completed: nil)
    }
}
