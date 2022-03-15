//
//  ViewController.swift
//  Lesson 2.3_HW1
//
//  Created by Kostya on 14.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var buttonsSV: UIStackView!
    
    @IBOutlet var loginTF: UITextField!
    @IBOutlet var passTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passTF.isSecureTextEntry = true
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "I get it", style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    @IBAction func logInBtnPressed() {
        if loginTF.text == "User" && passTF.text == "Pass"{
            performSegue(withIdentifier: "loginID", sender: nil)
            return
        }
        
        let startXPosition = buttonsSV.center.x
        
    
        self.loginTF.textColor = UIColor.red
        self.passTF.textColor = UIColor.red
    
        UIView.animate(withDuration: 0.1) {
            UIView.modifyAnimations(withRepeatCount: 2, autoreverses: true) {
                self.buttonsSV.center.x -= 10
            }
        } completion: { isFinished in
            self.buttonsSV.center.x = startXPosition
            self.passTF.text = ""
            self.passTF.textColor = .black
            self.loginTF.textColor = .black
        }
    }
    
    @IBAction func passBtnPassed() {
        showAlert(title: "Something go wrong 🤔", message: "Enter correct login or password. \n Login: User")
    }
    
    @IBAction func loginBtnPassed() {
        showAlert(title: "Ohhhh no 🙀", message: "Please remember your correct login or password. \n Password: Pass")
    }
}

