//
//  WelcomeViewController.swift
//  HomeWork3
//
//  Created by ALEKSEY SUSLOV on 04.02.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, " + userName + "!"
    }
}
