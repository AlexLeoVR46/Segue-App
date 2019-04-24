//
//  ViewController.swift
//  Segue
//
//  Created by home on 4/24/19.
//  Copyright © 2019 home. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var clickedTextField = UITextField()
    let username = "lessonOne"
    let password = "23041019"
    
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var userNameTextField: UITextField!
    
    @IBOutlet var logInLabelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       logInLabelButton.layer.cornerRadius = 5
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    // Фунция скрытия клавиатуры по тапу на экране
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func resultPressButton(_ sender: Any) {
        
    }
}

