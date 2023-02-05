//
//  WelcomeViewController.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-01-28.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    let bg:UIView = {
        //call gradient class name
        let view = CustomeGradient()
//        view.backgroundColor = .blue
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel = CustomLabel(title: "Food Recipies & Nutrition Application", size: 24)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()        
    }
    
    func setupUI(){
        view.addSubview(bg)
        view.addSubview(titleLabel)
        setupConstraint()
    }

    func setupConstraint(){

        //Background Gradint
        bg.topAnchor.constraint(equalTo: view.topAnchor, constant: 0 ).isActive = true
        bg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 ).isActive = true
        bg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 ).isActive = true
        bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0 ).isActive = true

        //title label
        titleLabel.topAnchor.constraint(equalTo: bg.topAnchor, constant: 50).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }


}
