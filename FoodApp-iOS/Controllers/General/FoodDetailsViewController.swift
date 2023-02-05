//
//  FoodDetailsViewController.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-02-03.
//


import UIKit

class FoodDetailsViewController: UIViewController {
    
    var foodID: String?
    var userID: String?
    let foodImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    let cuisinTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Cuisine"
        return label
    }()
    
    let cuisineLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let nutritionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Nutrition"
        return label
    }()
    
    let caloriesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let carbohydratesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let fatLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let proteinLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let sugarLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = ""
        return label
    }()
    
     let ingrediantTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Ingrediants"
        return label
    }()
    
    let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Description"
        return label
    }()
    
    let ingrediantLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0;
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
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
    
    let favouriteButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(named: "favIcon")?.withTintColor(.red)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(icon, for: .normal)
        button.addTarget(self, action: #selector(addToFavoriteList), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }

    func setupUI(){
        view.addSubview(foodImageView)
        view.addSubview(favouriteButton)
        view.addSubview(titleLabel)
        view.addSubview(cuisinTitleLabel)
        view.addSubview(cuisineLabel)
        view.addSubview(nutritionLabel)
        view.addSubview(caloriesLabel)
        view.addSubview(carbohydratesLabel)
        view.addSubview(proteinLabel)
        view.addSubview(sugarLabel)
        view.addSubview(fatLabel)
        view.addSubview(ingrediantTitleLabel)
        view.addSubview(ingrediantLabel)
        view.addSubview(descriptionTitleLabel)
        view.addSubview(descriptionLabel)
        setupConstraints()
    }
    
    func setupConstraints() {
        
        let imageViewConstraints = [
            foodImageView.topAnchor.constraint(equalTo: view.topAnchor),
            foodImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            foodImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            foodImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            foodImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3)
        ]
        
        let favoriteButtonConstraints = [
            favouriteButton.topAnchor.constraint(equalTo: foodImageView.bottomAnchor, constant: 20),
            favouriteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //favouriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            //favouriteButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            favouriteButton.widthAnchor.constraint(equalToConstant: 30),
            favouriteButton.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: foodImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ]
        
        let cuisineTitleLableConstraints = [
            cuisinTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            cuisinTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        
        let cuisineLabelConstraints = [
            cuisineLabel.topAnchor.constraint(equalTo: cuisinTitleLabel.bottomAnchor, constant: 20),
            cuisineLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        
        let nutritionLabelConstraints = [
            nutritionLabel.topAnchor.constraint(equalTo: cuisineLabel.bottomAnchor, constant: 30),
            nutritionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        
        let caloriesLabelConstraints = [
            caloriesLabel.topAnchor.constraint(equalTo: nutritionLabel.bottomAnchor, constant: 20),
            caloriesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        
        let carbohydratesLabelConstraints = [
            carbohydratesLabel.topAnchor.constraint(equalTo: caloriesLabel.bottomAnchor, constant: 20),
            carbohydratesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        
        let protineLabelConstraints = [
            proteinLabel.topAnchor.constraint(equalTo: carbohydratesLabel.bottomAnchor, constant: 20),
            proteinLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        
        let sugarLabelConstraints = [
            sugarLabel.topAnchor.constraint(equalTo: proteinLabel.bottomAnchor, constant: 20),
            sugarLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        
        let fatLabelConstraints = [
            fatLabel.topAnchor.constraint(equalTo: sugarLabel.bottomAnchor, constant: 20),
            fatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        
        let ingrediantTitleLabelConstraints = [
            ingrediantTitleLabel.topAnchor.constraint(equalTo: fatLabel.bottomAnchor, constant: 30),
            ingrediantTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        
        let ingrediantLabelConstraints = [
            ingrediantLabel.topAnchor.constraint(equalTo: ingrediantTitleLabel.bottomAnchor, constant: 20),
            ingrediantLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ingrediantLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ]
        
        let descriptionTitleLabelConstraints = [
            descriptionTitleLabel.topAnchor.constraint(equalTo: ingrediantLabel.bottomAnchor, constant: 30),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        
        let descriptionLabelConstraints = [
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ]

        
        NSLayoutConstraint.activate(imageViewConstraints)
        NSLayoutConstraint.activate(favoriteButtonConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(cuisineTitleLableConstraints)
        NSLayoutConstraint.activate(cuisineLabelConstraints)
        NSLayoutConstraint.activate(nutritionLabelConstraints)
        NSLayoutConstraint.activate(caloriesLabelConstraints)
        NSLayoutConstraint.activate(carbohydratesLabelConstraints)
        NSLayoutConstraint.activate(protineLabelConstraints)
        NSLayoutConstraint.activate(fatLabelConstraints)
        NSLayoutConstraint.activate(sugarLabelConstraints)
        NSLayoutConstraint.activate(ingrediantTitleLabelConstraints)
        NSLayoutConstraint.activate(ingrediantLabelConstraints)
        NSLayoutConstraint.activate(descriptionTitleLabelConstraints)
        NSLayoutConstraint.activate(descriptionLabelConstraints)
        
    }


    @objc func addToFavoriteList() {
        
        let userId = UserDefaults.standard.string(forKey: "userId")
        guard let unwrappedUserId = userId else {
            return
        }
        guard let unwrappedFoodId = foodID else {
            return
        }
        
        if unwrappedUserId == nil {
            let signInViewController = SignInViewController()
            present(signInViewController, animated: true, completion: nil)
        }
        else
        {
            
            APIConnection.addToFavorite(userId: unwrappedUserId, foodId: unwrappedFoodId) { result in
                switch result {
                case .success:
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Success", message: "Successfully add to favorite list", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Error", message: "Already added", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                }
            }
        }
    }
    ///
    
    
    public func config(with model: FoodDetailsViewModel) {
        foodID = model.foodId
        titleLabel.text = model.foodName
        cuisineLabel.text = "Cuisine Type: \(model.cuisine)"
        caloriesLabel.text = "Calories: \(model.calories)"
        carbohydratesLabel.text = "Carbohydrates: \(model.carbohydrates)"
        fatLabel.text = "Fat: \(model.fat)"
        proteinLabel.text = "Protein: \(model.protein)"
        sugarLabel.text = "Sugar: \(model.sugar)"
        ingrediantLabel.text = model.ingredient
        descriptionLabel.text = model.description
        //guard let url = URL(string: model.imageURL) else { return }
        guard let url = URL(string: model.imageUrl) else { return }
        foodImageView.sd_setImage(with: url, completed: nil)
    }
    
    

}

