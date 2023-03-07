//
//  SignUpViewController.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-02-05.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    
    let txtFirstName : UITextField = {
       let txtFirstName = UITextField()
        txtFirstName.translatesAutoresizingMaskIntoConstraints = false
        txtFirstName.borderStyle = .roundedRect
        txtFirstName.placeholder = "Enter Your First Name"
        txtFirstName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        txtFirstName.widthAnchor.constraint(equalToConstant: 300).isActive = true
        txtFirstName.layer.cornerRadius = 10
        txtFirstName.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        
        return txtFirstName
    }()
    
    let txtLastName : UITextField = {
       let txtLastName = UITextField()
        txtLastName.translatesAutoresizingMaskIntoConstraints = false
        txtLastName.borderStyle = .roundedRect
        txtLastName.placeholder = "Enter Your Last Name"
        txtLastName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        txtLastName.widthAnchor.constraint(equalToConstant: 300).isActive = true
        txtLastName.layer.cornerRadius = 10
        txtLastName.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        return txtLastName
    }()
    
    let txtEmail : UITextField = {
       let txtEmail = UITextField()
        txtEmail.translatesAutoresizingMaskIntoConstraints = false
        txtEmail.borderStyle = .roundedRect
        txtEmail.placeholder = "Email"
        txtEmail.heightAnchor.constraint(equalToConstant: 40).isActive = true
        txtEmail.widthAnchor.constraint(equalToConstant: 300).isActive = true
        txtEmail.layer.cornerRadius = 10
        txtEmail.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        return txtEmail
    }()
    
    let txtPassword : UITextField = {
       let txtPassword = UITextField()
        txtPassword.translatesAutoresizingMaskIntoConstraints = false
        txtPassword.borderStyle = .roundedRect
        txtPassword.placeholder = "Password"
        txtPassword.heightAnchor.constraint(equalToConstant: 40).isActive = true
        txtPassword.widthAnchor.constraint(equalToConstant: 300).isActive = true
        txtPassword.layer.cornerRadius = 10
        txtPassword.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        txtPassword.isSecureTextEntry = true
        return txtPassword
    }()
    
    let signUpButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.heightAnchor.constraint(equalToConstant: 45).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 300).isActive = true
        btn.layer.cornerRadius = 15
        btn.setTitle("Sign Up", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        btn.setTitleColor(.white, for: .normal)
        btn.frame = CGRect(x: 15, y: -50, width: 300, height: 500)
        btn.backgroundColor = UIColor.blue
        return btn
    }()
    
    let loginButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.widthAnchor.constraint(equalToConstant: 300).isActive = true
        button.layer.cornerRadius = 15
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x: 15, y: -50, width: 300, height: 500)
        button.backgroundColor = UIColor.gray
        return button
    }()
    
    let skipButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.widthAnchor.constraint(equalToConstant: 300).isActive = true
        button.layer.cornerRadius = 15
        button.setTitle("skip", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x: 15, y: -50, width: 300, height: 500)
        button.backgroundColor = UIColor(red: 230/255, green: 232/255, blue: 232/255, alpha: 1)
        return button
    }()
    
    

    
    let viewHolderMain : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let mainViewHolder : UIView = {
        let UI = UIView()
        UI.translatesAutoresizingMaskIntoConstraints = false
        return UI
    }()
      
       override func viewDidLoad() {
           super.viewDidLoad()
           self.view.backgroundColor = .systemBackground
           //_ = UserDefaults.standard.string(forKey: "userId")
           self.view.backgroundColor = .white
           let apperence = UINavigationBarAppearance()
           apperence.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
           navigationItem.standardAppearance = apperence
           self.navigationController?.navigationBar.prefersLargeTitles = true
           signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
           loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
           skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
           setupUI()
       }
    
    func setupUI(){
        titleLabel.text = "Sign Up"
        view.addSubview(mainViewHolder)
        mainViewHolder.addSubview(viewHolderMain)
        viewHolderMain.insertArrangedSubview(titleLabel, at: 0)
        viewHolderMain.insertArrangedSubview(txtFirstName, at: 1)
        viewHolderMain.insertArrangedSubview(txtLastName, at: 2)
        viewHolderMain.insertArrangedSubview(txtEmail, at: 3)
        viewHolderMain.insertArrangedSubview(txtPassword, at: 4)
        viewHolderMain.insertArrangedSubview(signUpButton, at: 5)
        viewHolderMain.insertArrangedSubview(loginButton, at: 6)
        viewHolderMain.insertArrangedSubview(skipButton, at: 7)
        view.addSubview(viewHolderMain)
        setupConstraint()
    }
    
    func setupConstraint(){
      
        mainViewHolder.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainViewHolder.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainViewHolder.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainViewHolder.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
      
        //add ViewHolder
        viewHolderMain.centerXAnchor.constraint(equalTo: mainViewHolder.centerXAnchor).isActive = true
        viewHolderMain.centerYAnchor.constraint(equalTo: mainViewHolder.centerYAnchor).isActive = true
        
}
    
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
       let fname = txtFirstName.text!
       let lname = txtLastName.text!
        let email = txtEmail.text!.lowercased()
       let password = txtPassword.text!
        
        if(fname.isEmpty == true)
        {
            let alert = UIAlertController(title: "Warning", message: "Please enter first name", preferredStyle: .alert)
            let action = UIAlertAction (title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        else if(lname.isEmpty == true)
        {
            let alert = UIAlertController(title: "Warning", message: "Please enter last name", preferredStyle: .alert)
            let action = UIAlertAction (title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        else if(email.isEmpty == true)
        {
            let alert = UIAlertController(title: "Warning", message: "Please enter email", preferredStyle: .alert)
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
            APIConnection.signUp(fname: fname, lname:lname, email: email, password: password) { result in
                switch result {
                case .success:
                    DispatchQueue.main.async {
                        let loginViewController = SignInViewController()
                        UIView.transition(with: UIApplication.shared.windows.first!, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                            UIApplication.shared.windows.first?.rootViewController = loginViewController
                        }, completion: nil)
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                
                }
            }

        }
        
    }
    
       
       @objc func loginButtonTapped() {
           let loginViewController = SignInViewController()
           UIView.transition(with: UIApplication.shared.windows.first!, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                 UIApplication.shared.windows.first?.rootViewController = loginViewController
             }, completion: nil)
       }
    @objc func skipButtonTapped() {
        let mainViewController = MainTabBarViewController()
        UIView.transition(with: UIApplication.shared.windows.first!, duration: 0.5, options: .transitionFlipFromLeft, animations: {
              UIApplication.shared.windows.first?.rootViewController = mainViewController
          }, completion: nil)
    }
    
    


}

