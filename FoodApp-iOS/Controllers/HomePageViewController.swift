//
//  HomePageViewController.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-01-29.
//

import UIKit

class HomePageViewController: UIViewController {
    
    let titleLabel = CustomLabel(title: "Food Recipies & Nutrition Application",color:.black, size: 24)
    let scr_width = UIScreen.main.bounds.size.width
    let scr_heigth = UIScreen.main.bounds.size.height
    
//    let titleLabel : UILabel = {
//       let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = .systemFont(ofSize: 24, weight: .regular)
//        label.textAlignment = .center
//        return label
//    }()
    
    let descriptionLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        //label.textColor = .blue
        return label
    }()
    
    let searchTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = .systemFont(ofSize: 17, weight: .regular)
//        // text field border color and width
//        textField.layer.borderColor = UIColor.black.cgColor
//        textField.layer.borderWidth = 1.0
        textField.textAlignment = .left
        //textField.layer.cornerRadius = 20
        textField.borderStyle = .roundedRect
        // get full screen size and divide
        //textField.frame.size.width = UIScreen.main.bounds.width - 20
        //textField.frame.size.width = 300
        //textField.frame.size.height = 300
        
//        //add icon to text field
//        textField.leftViewMode = UITextField.ViewMode.always
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//        let image = UIImage(named: "Search")
//        imageView.image = image
//        textField.leftView = imageView
        
        textField.placeholder = "Enter Food Name..."
        return textField
    }()
    
    
    
    let viewHolder : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let viewHolderMain : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let viewRecommenteded : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        titleLabel.text = "Hi, Anna"
        descriptionLabel.text = "What do you want to search today?"
        //let width = UIScreen.main.bounds.size.width
        print("screen width" + " \(scr_width)" + "heigth" + " \(scr_heigth)")
        
        setupUI()
    }
    
    
    func setupUI(){
        viewHolder.insertArrangedSubview(titleLabel, at: 0)
        viewHolder.insertArrangedSubview(descriptionLabel, at: 1)
        //viewHolder.insertArrangedSubview(searchTextField, at: 2)
        viewHolderMain.insertArrangedSubview(viewHolder, at: 0)
        //viewHolderMain.insertArrangedSubview(searchTextField, at: 1)
        
        view.addSubview(viewHolderMain)
        view.addSubview(searchTextField)
        setupConstraint()
    }
    
    func setupConstraint(){
        viewHolderMain.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        viewHolderMain.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        viewHolderMain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        searchTextField.topAnchor.constraint(equalTo: viewHolderMain.bottomAnchor, constant: 20).isActive = true
        searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        //searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        searchTextField.widthAnchor.constraint(equalToConstant: scr_width - 40).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
}
