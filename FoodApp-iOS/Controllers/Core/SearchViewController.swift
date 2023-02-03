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

    private let searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: SearchFoodResultsViewController())
        controller.searchBar.placeholder = "Search food name you like"
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        //setupUI()
        title = "Search Food"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.tintColor = .white
        view.addSubview(searchDataTable)
        searchDataTable.delegate = self
        searchDataTable.dataSource = self
        navigationItem.searchController = searchController
                fetchSearchData()
        searchController.searchResultsUpdater = self

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
            switch result {
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


extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        
        guard let query = searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty,
              query.trimmingCharacters(in: .whitespaces).count >= 5,
              let resultsController = searchController.searchResultsController as? SearchFoodResultsViewController else {
                  return                  
              }
        print("This is the query \(query)")
        
        APIConnection.shared.search(with: query) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let foods):
                    resultsController.foodData = foods
                    resultsController.searchFoodResultsCollectionView.reloadData()
                    print(result)
                case .failure(let error):
                    print(error.localizedDescription)
                    //print(error)
                }
            }
        }
    }
}
