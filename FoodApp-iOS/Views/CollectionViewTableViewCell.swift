//
//  CollectionViewTableViewCell.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-01-26.
//

import UIKit

protocol CollectionViewTableViewCellDelegate: AnyObject {
    func collectionViewTableViewCellDidTapCell(_ cell: CollectionViewTableViewCell, viewModel: FoodDetailsViewModel)
}

class CollectionViewTableViewCell: UITableViewCell {

    static let identifier = " "
    weak var delegate: CollectionViewTableViewCellDelegate?
    
    public var foodData: [FoodResponse] = [FoodResponse]()
    
    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FoodCollectionViewCell.self, forCellWithReuseIdentifier: FoodCollectionViewCell.identifier)
      return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBlue
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
     
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    public func config(with foodData:[FoodResponse]) {
        self.foodData = foodData
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCollectionViewCell.identifier, for: indexPath) as? FoodCollectionViewCell else {
            return UICollectionViewCell()
        }
        guard let model = foodData[indexPath.row].imageUrl else {return UICollectionViewCell()
        }       
        cell.config(with: model)
        return cell
    }
    //horizental cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let food = foodData[indexPath.row]
        guard let foodId = food.foodId else {
            return
        }


        APIConnection.shared.getSelectedFood(with: foodId ) { [weak self] result in
            switch result {
            case .success(let _ ):

                let food = self?.foodData[indexPath.row]
                guard (food?.foodId) != nil else {
                    return
                }
                guard let strongSelf = self else {
                    return
                }
                let viewModel = FoodDetailsViewModel(foodId: food?.foodId ?? "", foodName: food?.name ?? "", imageURL: food?.imageUrl ?? "", cuisine: food?.cuisine ?? "", description: food?.description ?? "", calories: food?.calories ?? "", carbohydrates: food?.carbohydrates ?? "", fat: food?.fat ?? "", protein: food?.protein ?? "", sugar: food?.sugar ?? "", ingredient: food?.ingredient ?? "", imageUrl: food?.imageUrl ?? "")
                self?.delegate?.collectionViewTableViewCellDidTapCell(strongSelf, viewModel: viewModel)
                //navigationController.pushViewController(FoodDetailsViewController(), animated: true)

            case .failure(let error):
                print(error.localizedDescription)
            }

        }
        
    }

}
