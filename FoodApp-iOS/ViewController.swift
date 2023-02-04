//
//  ViewController.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-01-25.
//

import UIKit

class ViewController: UIViewController {
        
        

        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = .white
            self.title = "Sun Food"
            let apperence = UINavigationBarAppearance()
            apperence.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navigationItem.standardAppearance = apperence
            self.navigationController?.navigationBar.prefersLargeTitles = true
            DetailsTableView.delegate = self
            DetailsTableView.dataSource = self
            
            //Banner Constraint
            viewHolder.insertArrangedSubview(descriptionLabel, at: 0)
            viewHolder.insertArrangedSubview(descriptionLabel1, at: 1)
            viewHolder.insertArrangedSubview(descriptionLabel2, at: 2)
            view.addSubview(viewHolder)
            viewHolder.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            viewHolder.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            viewHolder.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
//            //Set Image to Banner
//            bannerView.addSubview(MainBanner)
//            bannerView.clipsToBounds = true
//            MainBanner.heightAnchor.constraint(equalTo: bannerView.heightAnchor).isActive = true
//            MainBanner.widthAnchor.constraint(equalTo: bannerView.widthAnchor).isActive = true
//
//            //Set Content View
//            view.addSubview(ContentView)
//
//            ContentView.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: -30).isActive = true
//            ContentView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//            ContentView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
//
//
//
//            //Set Tabele To Content View
//            ContentView.addSubview(DetailsTableView)
//            DetailsTableView.heightAnchor.constraint(equalTo: ContentView.heightAnchor).isActive = true
//            DetailsTableView.widthAnchor.constraint(equalTo: ContentView.widthAnchor).isActive = true
//            DetailsTableView.topAnchor.constraint(equalTo: ContentView.topAnchor, constant: 30).isActive = true
//            DetailsTableView.tableFooterView = UIView()
            
        }
        
        
        let bannerView : UIView = {
           let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            //view.layer.backgroundColor = UIColor.systemTeal.cgColor
            return view
        }()
        
        let MainBanner : UIImageView = {
            let image = UIImageView(image: UIImage(named: "mainbanner"))
            image.translatesAutoresizingMaskIntoConstraints = false
            image.contentMode = .scaleAspectFill
            return image
        }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "This is a rice haloaaaaaaaaaaaaaaaesfsdvsdvfsvfbgnhmk,.i.ukmjnhfbdvfvbhnmj,,mymnhgvdfscfnm,mjnb"
        return label
    }()
    private let descriptionLabel1: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "This is a rice haloaaaaaaaaaaaaaaaesfsd df fgdg  fgfdg dfgdf dfhdfh dfhd dfhvsdvfsvfbgnhmk,.i.ukmjnhfbdvfvbhnmj,,mymnhgvdfscfnm,mjnb"
        return label
    }()
    
    private let descriptionLabel2: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "This is a rice haloaaaaaaaaaaaaaaaesfsd df fgdg  fgfdg dfgdf dfhdfh dfhd dfhvsdvfsvfbgnhmk,.i.ukmjnhfbdvfvbhnmj,,mymnhgvdfscfnm,mjnb"
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
        
        let ContentView : UIView = {
            let content = UIView()
            content.translatesAutoresizingMaskIntoConstraints = false
            content.layer.backgroundColor = UIColor.systemBackground.cgColor
            content.layer.cornerRadius = 30
            return content
        }()
        
        let DetailsTableView : UITableView = {
            let tableview = UITableView()
            tableview.translatesAutoresizingMaskIntoConstraints = false
            tableview.backgroundColor = UIColor.white
            tableview.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            //tableview.layer.cornerRadius = 30
            return tableview
        }()
        
    }

    extension ViewController : UITableViewDataSource, UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
            //return data.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = "Cell ID"
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 120
        }
        
       func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "Food Categories"
        }
        
        func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
            (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.white
        }
        
    }

    //class CellData: UITableViewCell {
    //
    //    let Foods : [String]
    //
    //    let FoodImage : UIImageView = {
    //        let imageView = UIImageView()
    //        imageView.translatesAutoresizingMaskIntoConstraints = false
    //        imageView.contentMode = .scaleAspectFit
    //        return imageView
    //    }()
    //
    //}


