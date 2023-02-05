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
                
                let descriptionLabel : UILabel = {
                    let label = UILabel()
                    label.translatesAutoresizingMaskIntoConstraints = false
                    label.font = .systemFont(ofSize: 16)
                    label.textAlignment = .center
                    return label
                }()
                
                let txtusername : UITextField = {
                   let txtuser = UITextField()
                    txtuser.translatesAutoresizingMaskIntoConstraints = false
                    txtuser.borderStyle = .roundedRect
                    txtuser.heightAnchor.constraint(equalToConstant: 40).isActive = true
                    txtuser.widthAnchor.constraint(equalToConstant: 300).isActive = true
                    txtuser.layer.cornerRadius = 10
                    txtuser.layer.borderWidth = 1
                    txtuser.layer.borderColor = UIColor.black.cgColor
                    return txtuser
                }()
                
                let txtpassword : UITextField = {
                   let txtpass = UITextField()
                    txtpass.translatesAutoresizingMaskIntoConstraints = false
                    txtpass.borderStyle = .roundedRect
                    txtpass.heightAnchor.constraint(equalToConstant: 40).isActive = true
                    txtpass.widthAnchor.constraint(equalToConstant: 300).isActive = true
                    txtpass.layer.cornerRadius = 10
                    txtpass.layer.borderWidth = 1
                    txtpass.layer.borderColor = UIColor.black.cgColor
                    txtpass.isSecureTextEntry = true
                    return txtpass
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
                let btn = UIButton()
                btn.translatesAutoresizingMaskIntoConstraints = false
                btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
                btn.widthAnchor.constraint(equalToConstant: 300).isActive = true
                btn.layer.cornerRadius = 20
                btn.setTitle("Sign In", for: .normal)
                btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
                btn.setTitleColor(.white, for: .normal)
                btn.frame = CGRect(x: 15, y: -50, width: 300, height: 500)
                btn.backgroundColor = UIColor.blue
                btn.layer.borderWidth = 1
                btn.layer.borderColor = UIColor.black.cgColor
                //btn.frame = CGRect(x: 10, y: 50, width: 100, height: 30)
                btn.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
                return btn
            }()
        
        let logo : UIImageView = {
            let image = UIImageView(image: UIImage(named: "icon2"))
            image.translatesAutoresizingMaskIntoConstraints = false
            image.contentMode = .scaleAspectFit
            image.heightAnchor.constraint(equalToConstant: 80).isActive = true
            image.widthAnchor.constraint(equalToConstant: 80).isActive = true
            return image
        }()
        
            let btnSignUp : UIButton = {
                let btn = UIButton()
                btn.translatesAutoresizingMaskIntoConstraints = false
                btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
                btn.widthAnchor.constraint(equalToConstant: 300).isActive = true
                btn.layer.cornerRadius = 20
                btn.setTitle("Sign Up", for: .normal)
                btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
                btn.setTitleColor(.white, for: .normal)
                btn.frame = CGRect(x: 15, y: -50, width: 300, height: 500)
                btn.backgroundColor = UIColor.gray
                btn.layer.borderWidth = 1
                btn.layer.borderColor = UIColor.black.cgColor
                //btn.frame = CGRect(x: 10, y: 50, width: 100, height: 30)
                btn.addTarget(self, action: #selector(goToNextPage), for: .touchUpInside)
                return btn
            }()
        
        let TOPContainer : UIView = {
            let UI = UIView()
            UI.translatesAutoresizingMaskIntoConstraints = false
            return UI
        }()
        
        
        @objc func loginAction()
        {
            let email = txtusername.text!.lowercased()
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
                   let loginViewController = MainTabBarViewController()
                    UIView.transition(with: UIApplication.shared.windows.first!, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                          UIApplication.shared.windows.first?.rootViewController = loginViewController
                      }, completion: nil)
                }
                
                func assignbackground(){
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
                    //assignbackground()
                    let apperence = UINavigationBarAppearance()
                    apperence.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
                    navigationItem.standardAppearance = apperence
                    self.navigationController?.navigationBar.prefersLargeTitles = true
                    titleLabel.text = "Login"
                    descriptionLabel.text = "Welcome back to Tasty Foods Recepies!"
                    txtusername.placeholder = "Username"
                    txtpassword.placeholder = "Password"
                    view.addSubview(TOPContainer)
                    TOPContainer.addSubview(viewHolderMain)
                    viewHolderMain.insertArrangedSubview(logo, at: 0)
                    viewHolderMain.insertArrangedSubview(titleLabel, at: 1)
                    viewHolderMain.insertArrangedSubview(descriptionLabel, at: 2)
                    viewHolderMain.insertArrangedSubview(txtusername, at: 3)
                    viewHolderMain.insertArrangedSubview(txtpassword, at: 4)
                    viewHolderMain.insertArrangedSubview(btnSignIn, at: 5)
                    viewHolderMain.insertArrangedSubview(btnSignUp, at: 6)
                    view.addSubview(viewHolderMain)
                    setupConstraint()
                    
                }
                
                   //Set Manual Constraint
                    func setupConstraint(){
                      
                        TOPContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
                        TOPContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
                        TOPContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
                        TOPContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
                      
                        //add ViewHolder
                        viewHolderMain.centerXAnchor.constraint(equalTo: TOPContainer.centerXAnchor).isActive = true
                        viewHolderMain.centerYAnchor.constraint(equalTo: TOPContainer.centerYAnchor).isActive = true
                }


}

