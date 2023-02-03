//
//  FoodDetailsViewController.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-02-03.
//


import UIKit

class FoodDetailsViewController: UIViewController {
    
    private let foodImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.numberOfLines = 0
        label.text = "Rice"
        return label
    }()
    
    private let cuisineLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "This is a rice halo"
        return label
    }()
    
    private let nutritionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "This is a rice halo"
        return label
    }()
    
    private let caloriesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "This is a rice halo"
        return label
    }()
    
    private let carbohydratesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "This is a rice halo"
        return label
    }()
    
    private let fatLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "This is a rice halo"
        return label
    }()
    
    private let proteinLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "This is a rice halo"
        return label
    }()
    
    private let sugarLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "This is a rice halo"
        return label
    }()
    
    private let ingrediantTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "This is a rice halo"
        return label
    }()
    
    private let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "This is a rice halo"
        return label
    }()
    
    private let ingrediantLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "This is a rice halo"
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "This is a rice halo"
        return label
    }()
    
    let viewHolder : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Favorite", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        
        return button
    }()
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    func setupScrollView(){
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            contentView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(scrollView)
            scrollView.addSubview(contentView)
            
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        setupScrollView()
    }
    
    func setupUI(){
        view.addSubview(foodImageView)
        view.addSubview(titleLabel)
        viewHolder.insertArrangedSubview(cuisineLabel, at: 0)
        viewHolder.insertArrangedSubview(nutritionLabel, at: 1)
        viewHolder.insertArrangedSubview(caloriesLabel, at: 2)
        viewHolder.insertArrangedSubview(carbohydratesLabel, at: 3)
        viewHolder.insertArrangedSubview(fatLabel, at: 4)
        viewHolder.insertArrangedSubview(proteinLabel, at: 5)
        viewHolder.insertArrangedSubview(sugarLabel, at: 6)
        viewHolder.insertArrangedSubview(ingrediantTitleLabel, at: 7)
        viewHolder.insertArrangedSubview(ingrediantLabel, at: 8)
        viewHolder.insertArrangedSubview(descriptionTitleLabel, at: 9)
        viewHolder.insertArrangedSubview(descriptionLabel, at: 10)
        view.addSubview(viewHolder)
        view.addSubview(favoriteButton)
        setupConstraints()
    }
    

    
    func setupConstraints() {
        let imageViewConstraints = [
            foodImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            foodImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            foodImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            foodImageView.heightAnchor.constraint(equalToConstant: 300)
        ]
//
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: foodImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        
        let viewHolderConstraints = [
            viewHolder.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            viewHolder.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            viewHolder.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        let favoriteButtonConstraints = [
            favoriteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            favoriteButton.topAnchor.constraint(equalTo: viewHolder.bottomAnchor, constant: 25),
            favoriteButton.widthAnchor.constraint(equalToConstant: 140),
            favoriteButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(imageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(viewHolderConstraints)
        NSLayoutConstraint.activate(favoriteButtonConstraints)
        
    }
    
    
    public func config(with model: FoodDetailsViewModel) {
        titleLabel.text = model.foodName
        cuisineLabel.text = "Cuisine Type: \(model.cuisine)"
        nutritionLabel.text = "Nutrition Level"
        caloriesLabel.text = "Calories: \(model.calories)"
        carbohydratesLabel.text = "Carbohydrates: \(model.carbohydrates)"
        fatLabel.text = "Fat: \(model.fat)"
        proteinLabel.text = "Protein: \(model.protein)"
        sugarLabel.text = "Sugar: \(model.sugar)"
        ingrediantTitleLabel.text = "Ingrediants"
        ingrediantLabel.text = model.ingredient
        descriptionTitleLabel.text = "Description"
        descriptionLabel.text = model.description
        guard let url = URL(string: model.imageURL) else { return }
        foodImageView.sd_setImage(with: url, completed: nil)
    }
    

}
