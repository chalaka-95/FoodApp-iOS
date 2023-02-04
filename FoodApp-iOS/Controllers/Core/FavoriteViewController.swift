//
//  FavoriteViewController.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-01-26.
//

import UIKit

class FavoriteViewController: UIViewController {

    
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
        title = "Favorite Foods List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.tintColor = .white
        view.addSubview(searchDataTable)
        searchDataTable.delegate = self
        searchDataTable.dataSource = self
        fetchSearchData(query: "63c4096c8dafc5f956bf1e92")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchDataTable.frame = view.bounds
    }
    
    
}

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
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
    
    
    private func fetchSearchData(query: String){
        APIConnection.shared.searchFavFoodsByUserId(with: query) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let foods):
                    self?.foodData = foods
                    self?.searchDataTable.reloadData()
                    print(result)
                case .failure(let error):
                    print(error.localizedDescription)
                    //print(error)
                }
            }
        }
    }
    
}



