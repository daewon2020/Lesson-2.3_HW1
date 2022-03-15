//
//  ViewController.swift
//  Lesson 2.3_HW1
//
//  Created by Kostya on 14.03.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var buttonsSV: UIStackView!
    
    @IBOutlet var loginTF: UITextField!
    @IBOutlet var passTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passTF.isSecureTextEntry = true
        
        loginTF.delegate = self
        passTF.delegate = self
        
        passTF.enablesReturnKeyAutomatically = true
        
        loginTF.returnKeyType = UIReturnKeyType.next
        passTF.returnKeyType = UIReturnKeyType.done
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = loginTF.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
    }
    
    @IBAction func logInBtnPressed() {
        if loginTF.text == "User" && passTF.text == "Pass"{
            performSegue(withIdentifier: "loginID", sender: nil)
            return
        }
        showLoginFailAnimation()
    }
    
    @IBAction func passBtnPassed() {
        showAlert(title: "Ohhhh no 🙀", message: "Please remember your correct login or password \n\n Current password: Pass")
    }
    
    @IBAction func loginBtnPassed() {
        showAlert(title: "Something went wrong 🤔", message: "Enter correct login or password \n\n Current Login: User")
        
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        passTF.text = ""
        loginTF.text = ""
        loginTF.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTF {
            passTF.becomeFirstResponder()
            return true
        }
        if textField == passTF {
            logInBtnPressed()
            return true
        }
        return false
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "I got it", style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    private func showLoginFailAnimation() {
        self.loginTF.textColor = UIColor.red
        self.passTF.textColor = UIColor.red

        loginTF.center.x -= 3
        passTF.center.x -= 3

        UIView.animate(withDuration: 0.07) {
            UIView.modifyAnimations(withRepeatCount: 2, autoreverses: true) {
                self.loginTF.center.x += 6
                self.passTF.center.x += 6
            }
        } completion: { isFinished in
            self.passTF.text = ""
            self.passTF.textColor = .black
            self.loginTF.textColor = .black
            self.loginTF.center.x -= 3
            self.passTF.center.x -= 3
            
        }
    }
}

