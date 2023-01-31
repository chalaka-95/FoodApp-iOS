//
//  TitleCollectionViewCell.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-01-31.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    static let identifier = "TitleCollectionViewCell"
    private let foodImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
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
