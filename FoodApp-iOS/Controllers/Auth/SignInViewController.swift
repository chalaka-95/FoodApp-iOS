//
//  SignInViewController.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-02-05.
//

import UIKit

class SignInViewController: UIViewController {

                let titleLabel : UILabel = {
                    let label = UILabel()
                    label.translatesAutoresizingMaskIntoConstraints = false
                    label.font = .systemFont(ofSize: 30, weight: .bold)
                    label.textAlignment = .center
                    return label
                }()
                
                
                let txtUserName : UITextField = {
                   let text = UITextField()
                    text.translatesAutoresizingMaskIntoConstraints = false
                    text.borderStyle = .roundedRect
                    text.heightAnchor.constraint(equalToConstant: 40).isActive = true
                    text.widthAnchor.constraint(equalToConstant: 300).isActive = true
                    text.layer.cornerRadius = 10
                    text.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
                    return text
                }()
                
                let txtpassword : UITextField = {
                   let text = UITextField()
                    text.translatesAutoresizingMaskIntoConstraints = false
                    text.borderStyle = .roundedRect
                    text.heightAnchor.constraint(equalToConstant: 40).isActive = true
                    text.widthAnchor.constraint(equalToConstant: 300).isActive = true
                    text.layer.cornerRadius = 10
                    text.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
                    text.isSecureTextEntry = true
                    return text
                }()
    
                let descriptionLabel : UILabel = {
                    let label = UILabel()
                    label.translatesAutoresizingMaskIntoConstraints = false
                    label.font = .systemFont(ofSize: 16)
                    label.textAlignment = .center
                    return label
                }()
                
                let viewHolderMain : UIStackView = {
                    let stack = UIStackView()
                    stack.axis = .vertical
                    stack.spacing = 15
                    stack.alignment = .center
                    stack.translatesAutoresizingMaskIntoConstraints = false
                    return stack
                }()
            
            let btnSignIn : UIButton = {
                let button = UIButton()
                button.translatesAutoresizingMaskIntoConstraints = false
                button.heightAnchor.constraint(equalToConstant: 45).isActive = true
                button.widthAnchor.constraint(equalToConstant: 300).isActive = true
                button.layer.cornerRadius = 15
                button.setTitle("Login", for: .normal)
                button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
                button.setTitleColor(.white, for: .normal)
                button.frame = CGRect(x: 15, y: -50, width: 300, height: 500)
                button.backgroundColor = UIColor(red: 102/255, green: 0/255, blue: 204/255, alpha: 1)
                button.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
                return button
            }()
        
        let logo : UIImageView = {
            let image = UIImageView(image: UIImage(named: "launch"))
            image.translatesAutoresizingMaskIntoConstraints = false
            image.contentMode = .scaleAspectFit
            image.heightAnchor.constraint(equalToConstant: 80).isActive = true
            image.widthAnchor.constraint(equalToConstant: 80).isActive = true
            return image
        }()
        
            let btnSignUp : UIButton = {
                let button = UIButton()
                button.translatesAutoresizingMaskIntoConstraints = false
                button.heightAnchor.constraint(equalToConstant: 45).isActive = true
                button.widthAnchor.constraint(equalToConstant: 300).isActive = true
                button.layer.cornerRadius = 15
                button.setTitle("Sign Up", for: .normal)
                button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
                button.setTitleColor(.white, for: .normal)
                button.frame = CGRect(x: 15, y: -50, width: 300, height: 500)
                button.backgroundColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
                button.addTarget(self, action: #selector(goToNextPage), for: .touchUpInside)
                return button
            }()
        
        let mainViewHolder : UIView = {
            let UI = UIView()
            UI.translatesAutoresizingMaskIntoConstraints = false
            return UI
        }()
        
        
        @objc func loginAction()
        {
            let email = txtUserName.text!.lowercased()
            let password = txtpassword.text!.lowercased()
            
            if (email.isEmpty == true)
            {
                let alert = UIAlertController(title: "Warning", message: "Please enter username", preferredStyle: .alert)
                let action = UIAlertAction (title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
            else if(password.isEmpty == true)
            {
                let alert = UIAlertController(title: "Warning", message: "Please enter password", preferredStyle: .alert)
                let action = UIAlertAction (title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
            else
            {
                APIConnection.userLogin(email: email, password: password) { result in
                    switch result {
                    case .success:
                        DispatchQueue.main.async {
                            let loginViewController = MainTabBarViewController()
                             UIView.transition(with: UIApplication.shared.windows.first!, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                                   UIApplication.shared.windows.first?.rootViewController = loginViewController
                               }, completion: nil)
                        }
                    case .failure(let error):
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: "Error", message: "Username or Password Incorrect", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                    
                    }
                }
            }
        }
            
              
                @objc func goToNextPage() {
                   let signUpViewController = SignUpViewController()
                    UIView.transition(with: UIApplication.shared.windows.first!, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                          UIApplication.shared.windows.first?.rootViewController = signUpViewController
                      }, completion: nil)
                }
                
                func logoImage(){
                    let background = UIImage(named: "signinbackground")

                    var imageView : UIImageView!
                    imageView = UIImageView(frame: view.bounds)
                    imageView.contentMode =  .scaleAspectFill
                    imageView.clipsToBounds = true
                    imageView.image = background
                    imageView.center = view.center
                    view.addSubview(imageView)
                    self.view.sendSubviewToBack(imageView)
                }
            
                override func viewDidLoad() {
                    super.viewDidLoad()
                    self.view.backgroundColor = .white
                    //logoImage()
                    let apperence = UINavigationBarAppearance()
                    apperence.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
                    navigationItem.standardAppearance = apperence
                    self.navigationController?.navigationBar.prefersLargeTitles = true
                    titleLabel.text = "Login"
                    descriptionLabel.text = "Welcome to Foods Recepies and Nutrition"
                    txtUserName.placeholder = "Username"
                    txtpassword.placeholder = "Password"
                    view.addSubview(mainViewHolder)
                    mainViewHolder.addSubview(viewHolderMain)
                    viewHolderMain.insertArrangedSubview(logo, at: 0)
                    viewHolderMain.insertArrangedSubview(titleLabel, at: 1)
                    viewHolderMain.insertArrangedSubview(descriptionLabel, at: 2)
                    viewHolderMain.insertArrangedSubview(txtUserName, at: 3)
                    viewHolderMain.insertArrangedSubview(txtpassword, at: 4)
                    viewHolderMain.insertArrangedSubview(btnSignIn, at: 5)
                    viewHolderMain.insertArrangedSubview(btnSignUp, at: 6)
                    view.addSubview(viewHolderMain)
                    setupConstraint()
                    
                }
                
                   //Set Manual Constraint
                    func setupConstraint(){
                      
                        mainViewHolder.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
                        mainViewHolder.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
                        mainViewHolder.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
                        mainViewHolder.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
                      
                        //add ViewHolder
                        viewHolderMain.centerXAnchor.constraint(equalTo: mainViewHolder.centerXAnchor).isActive = true
                        viewHolderMain.centerYAnchor.constraint(equalTo: mainViewHolder.centerYAnchor).isActive = true
                }


}

