//
//  SearchViewController.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-01-26.
//

import UIKit

class SearchViewController: UIViewController {
    
    //let header = customHeaderView()
    private var foodData: [FoodResponse] = [FoodResponse]()

    private let searchDataTable: UITableView = {
        let table = UITableView()
        table.register(FoodTableViewCell.self, forCellReuseIdentifier: FoodTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        //setupUI()
        title = "Search Food"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(searchDataTable)
        searchDataTable.delegate = self
        searchDataTable.dataSource = self
        
        fetchSearchData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchDataTable.frame = view.bounds
    }
//    func setupUI(){
//        view.addSubview(header)
//        setupConstraint()
//    }
//
//    func setupConstraint(){
//        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        header.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        header.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        header.heightAnchor.constraint(equalToConstant: 100).isActive = true
//    }

}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FoodTableViewCell.identifier, for: indexPath) as? FoodTableViewCell else {
            return UITableViewCell()
        }
        
        
        let food = foodData[indexPath.row]
        let model = FoodViewModel(foodName: food.name ?? "Unknown name", imageURL: food.imageUrl ?? "")
        cell.config(with: model)
        
        return cell;
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    private func fetchSearchData(){
        APIConnection.shared.getSearchFood { [weak self] result in
            switch result{
            case.success(let foods):
                self?.foodData = foods
                DispatchQueue.main.async {
                    self?.searchDataTable.reloadData()
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
