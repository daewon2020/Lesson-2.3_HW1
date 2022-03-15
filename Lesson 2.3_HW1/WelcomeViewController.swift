//
//  WelcomeViewController.swift
//  Lesson 2.3_HW1
//
//  Created by Kostya on 15.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeTF: UILabel!
    @IBOutlet var emojiLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: false)
        
        if let userName = userName {
            welcomeTF.text = "Welcome, \(userName)"
        } else {
            welcomeTF.text = "Welcome, unknown user"
        }
        
        emojiLabel.text = "👋"
        setGradient()
    }

    private func setGradient() {
        var gradientLayer: CAGradientLayer!
        
        let colorTop = UIColor(red: 180.0 / 255.0, green: 105 / 255.0, blue: 42.0 / 122.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 109.0 / 255.0, green: 139.0 / 255.0, blue: 217.0 / 255.0, alpha: 1.0).cgColor
        
        gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                    
        view.layer.insertSublayer(gradientLayer, at:0)
    }
}
