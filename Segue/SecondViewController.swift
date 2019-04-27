//
//  SecondViewController.swift
//  Segue
//
//  Created by home on 4/24/19.
//  Copyright © 2019 home. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var resultTextField: UILabel!
    
    let username = "lessonOne"
    let passwordIn = "23041019"
    
    var currentLogin = ""
    var currentPassword = ""
    var result = ""
    
    override func viewWillAppear(_ animated: Bool) {
        doAction(action: result)
    }
    
    //Func of Identity verification, login and password
    private func identityCheck(currentLogin: String, currentPassword: String) -> Bool {
        return currentLogin == username && currentPassword == passwordIn
    }
    
    
    //Func of perform action depending on the button click "LogIn" or "Forgot password"
    private func doAction(action: String) {
        switch action {
        case "loginSegue":
            if identityCheck(currentLogin: currentLogin, currentPassword: currentPassword) {
                resultTextField.text = "Access successfull"
                resultTextField.textColor = .green
            }
            else
            {
                resultTextField.text = "Your login or password is incorrect"
                resultTextField.textColor = .red
            }
        case "passUsernameSegue":
            resultTextField.text = "Correct password - \(passwordIn) and login - \(username) "  
        default:
            resultTextField.text = "Unknown action"
        }
    }

}
