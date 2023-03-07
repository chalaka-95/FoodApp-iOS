//
//  MainTabBarViewController.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-01-26.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("MainTabBar is Running....")
        let tabBarController = UITabBarController()
        tabBarController.tabBar.isTranslucent = false

        let hvc = UINavigationController(rootViewController: HomeViewController())
        let svc = UINavigationController(rootViewController: SearchViewController())
        let fvc = UINavigationController(rootViewController: FavoriteViewController())
        let pvc = UINavigationController(rootViewController: ProfileViewController())
        
        hvc.tabBarItem.image = UIImage(systemName: "house")
        fvc.tabBarItem.image = UIImage(systemName: "heart")
        svc.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        pvc.tabBarItem.image = UIImage(systemName: "person")
        
        tabBar.tintColor = .label
        
        hvc.title = "Home"
        svc.title = "Search"
        fvc.title = "Favorite"
        pvc.title = "Profile"
        
        setViewControllers([hvc,svc,fvc,pvc], animated: true)
    }
}
