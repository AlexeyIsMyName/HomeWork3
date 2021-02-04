//
//  LoginViewController.swift
//  HomeWork3
//
//  Created by ALEKSEY SUSLOV on 04.02.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Private Properties
    private let userName = "Donald"
    private let password = "MAGA2020"
    
    // MARK: - Override Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    @IBAction func forgotButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0: showAlarmWith(title: "Oops!",
                              message: "Your name is \(userName)  🧐")
        case 1: showAlarmWith(title: "Oops!",
                              message: "Your password is \(password)  🧐")
        default: break
        }
    }
    
    @IBAction func logInButtonPressed() {
        if userNameTextField.text != userName || passwordTextField.text != password {
            showAlarmWith(title: "Invalid login or password",
                          message: "Please, enter correct login and password")
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userName
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
    
    // MARK: - Private Methods
    private func showAlarmWith(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}
