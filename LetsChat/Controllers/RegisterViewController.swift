//
//  RegisterViewController.swift
//  LetsChat
//
//  Created by Omotayo on 24/01/2022.
//

import UIKit

class RegisterViewController: UIViewController {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let firstNameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "First Name"
        
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        
        return field
    }()
    
    private let lastNameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Last Name"
        
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        
        return field
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
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    @objc private func didTapRegisterButton() {
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let firstName = firstNameField.text,
              let lastName = lastNameField.text,
              let email = emailField.text,
              let password = passwordField.text,
              !firstName.isEmpty, !lastName.isEmpty,
              !email.isEmpty, !password.isEmpty
        else {
            alertLoginError()
            return
        }
        
        // Firebase login
        
    }
    
    private func alertLoginError() {
        let alertController = UIAlertController(
            title: "Woops",
            message: "Please enter all information to register.", preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Account"
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.addSubviews(views: imageView, firstNameField, lastNameField,
                               emailField, passwordField, registerButton)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapProfileImage))
        gesture.numberOfTouchesRequired = 1
        gesture.numberOfTapsRequired = 1
        
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(gesture)
        
        firstNameField.delegate = self
        lastNameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        
        registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        let size = scrollView.width / 3
        imageView.frame = CGRect(x: (scrollView.width - size) / 2, y: 20, width: size, height: size)
        firstNameField.frame = CGRect(x: 20, y: imageView.bottom + 20, width: scrollView.width - 40, height: 52)
        lastNameField.frame = CGRect(x: 20, y: firstNameField.bottom + 20, width: scrollView.width - 40, height: 52)
        emailField.frame = CGRect(x: 20, y: lastNameField.bottom + 20, width: scrollView.width - 40, height: 52)
        passwordField.frame = CGRect(x: 20, y: emailField.bottom + 20, width: scrollView.width - 40, height: 52)
        registerButton.frame = CGRect(x: 20, y: passwordField.bottom + 20, width: scrollView.width - 40, height: 52)
    }
    
    @objc private func didTapLoginBtn() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapProfileImage() {
        print("Change profile pic")
    }
    
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            passwordField.becomeFirstResponder()
        } else {
            didTapRegisterButton()
        }
        return true
    }
}
