//
//  SearchViewController.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-01-26.
//

import UIKit

class SearchViewController: UIViewController {
    
    let header = customHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI(){
        view.addSubview(header)
        setupConstraint()
    }

    func setupConstraint(){
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        header.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

}
