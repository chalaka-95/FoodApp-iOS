//
//  HomeViewController.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-01-26.
//

import UIKit

class HomeViewController: UIViewController {
    
    let sectionTitles: [String] = ["Indian", "Chinese", "Thai",  "Italian", "Japanese", "American"]
    enum Sections: Int {
        case IndianFoods = 0
        case ChineseFoods = 1
        case ThaiFoods = 2
        case ItalianFoods = 3
        case JapaneseFoods = 4
        case AmericanFoods = 5
    }
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        //setdata //connect with extension UITableViewDelegate, UITableViewDataSource classes
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        ConfigureNavBar()
        
        //Set headerUIView
        let headerView = HeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height/2))
        homeFeedTable.tableHeaderView = headerView
        //snavigationController?.pushViewController(FoodDetailsViewController(), animated: true)
        ConfigureNavBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
    private func ConfigureNavBar(){
        
        let leftButton = UIBarButtonItem(title: "Chala Food Recipes & Nutrition", style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = leftButton
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        
        cell.delegate = self

        switch indexPath.section {
            
        case Sections.IndianFoods.rawValue:
            APIConnection.shared.getIndianFood { TrendingFoodResponse in
                switch TrendingFoodResponse {

                case .success(let foods):
                    cell.config(with: foods)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        case Sections.ChineseFoods.rawValue:
                    APIConnection.shared.getChineseFood { result in
                        switch result {
                        case .success(let foods):
                            cell.config(with: foods)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
            
        case Sections.ThaiFoods.rawValue:
                    APIConnection.shared.getThaiFood { result in
                        switch result {
                        case .success(let foods):
                            cell.config(with: foods)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
            
        case Sections.ItalianFoods.rawValue:
                    APIConnection.shared.getItalianFood { result in
                        switch result {
                        case .success(let foods):
                            cell.config(with: foods)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
            
        case Sections.JapaneseFoods.rawValue:
                    APIConnection.shared.getJapaneseFood { result in
                        switch result {
                        case .success(let foods):
                            cell.config(with: foods)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
            
        case Sections.AmericanFoods.rawValue:
                    APIConnection.shared.getAmericanFood { result in
                        switch result {
                        case .success(let foods):
                            cell.config(with: foods)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
        default:
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .black
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
    
    //Table title headers
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    //Table scroll then navbar auto hide
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset

        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}
//navi
extension HomeViewController: CollectionViewTableViewCellDelegate {
    func collectionViewTableViewCellDidTapCell(_ cell: CollectionViewTableViewCell, viewModel: FoodDetailsViewModel) {
        DispatchQueue.main.async { [weak self] in
            let vc = FoodDetailsViewController()
            vc.config(with: viewModel)
            self?.navigationController?.pushViewController(vc, animated: true)
            //self?.tabBarController?.tabBar.isHidden = true
        }
    }
}
