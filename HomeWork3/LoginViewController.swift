//
//  LoginViewController.swift
//  HomeWork3
//
//  Created by ALEKSEY SUSLOV on 04.02.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Private Properties
    private let userName = "Donald"
    private let password = "MAGA2020"
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameTextField.delegate = self
    }
    
    // MARK: - Override Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userName
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
            passwordTextField.text = nil
            showAlarmWith(title: "Invalid login or password",
                          message: "Please, enter correct login and password")
        } else {
            performSegue(withIdentifier: "firstSegue",
                         sender: nil)
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
    
    // MARK: - TextFieldDelegate Method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        }
        return true
    }
    
    // MARK: - Private Methods
    private func showAlarmWith(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default))
        present(alert, animated: true, completion: nil)
    }
}
