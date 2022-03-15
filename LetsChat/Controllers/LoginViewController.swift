//
//  LoginViewController.swift
//  LetsChat
//
//  Created by Omotayo on 24/01/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Email Address..."
        
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Password..."
        field.isSecureTextEntry = true
        
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    @objc private func didTapLoginButton() {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email = emailField.text, let password = passwordField.text, !email.isEmpty, !password.isEmpty else {
            alertLoginError()
            return
        }
        
        // Firebase login
    }
    
    private func alertLoginError() {
        let alertController = UIAlertController(
            title: "Woops",
            message: "Please enter all information to log in.", preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        view.backgroundColor = .systemBackground
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Register",
            style: .plain,
            target: self,
            action: #selector(didTapRegisterBtn)
        )
        view.addSubview(scrollView)
        scrollView.addSubviews(views: imageView, emailField, passwordField, loginButton)
        
        emailField.delegate = self
        passwordField.delegate = self
        
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        let size = scrollView.width / 3
        imageView.frame = CGRect(x: (scrollView.width - size) / 2, y: 20, width: size, height: size)
        emailField.frame = CGRect(x: 20, y: imageView.bottom + 20, width: scrollView.width - 40, height: 52)
        passwordField.frame = CGRect(x: 20, y: emailField.bottom + 20, width: scrollView.width - 40, height: 52)
        loginButton.frame = CGRect(x: 20, y: passwordField.bottom + 20, width: scrollView.width - 40, height: 52)
    }

    @objc private func didTapRegisterBtn() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            passwordField.becomeFirstResponder()
        } else {
            didTapLoginButton()
        }
        return true
    }
}
