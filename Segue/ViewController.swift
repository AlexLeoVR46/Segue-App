//
//  ViewController.swift
//  Segue
//
//  Created by home on 4/24/19.
//  Copyright © 2019 home. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var userNameTextField: UITextField!
    
    @IBOutlet var logInLabelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInLabelButton.layer.cornerRadius = 5
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // The function of hiding the keyboard by tap on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //Function show and hide keyboard
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
    
    
    // Function of data transfer  to the second View controller 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let destination = segue.destination as? SecondViewController else {return}
        guard let action = segue.identifier else {return}
        
        destination.currentLogin = userNameTextField.text ?? ""
        destination.currentPassword = passwordTextField.text ?? ""
        destination.result = action
        
        self.view.endEditing(true)
        
    }
    

}

