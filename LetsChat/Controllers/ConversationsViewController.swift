//
//  ViewController.swift
//  LetsChat
//
//  Created by Omotayo on 24/01/2022.
//

import UIKit

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let isAuthenticated = UserDefaults.standard.bool(forKey: "logged_in")
        
        if !isAuthenticated {
            let vc = LoginViewController()
            let navVC = UINavigationController(rootViewController: vc)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true, completion: nil)
        }
    }

}

