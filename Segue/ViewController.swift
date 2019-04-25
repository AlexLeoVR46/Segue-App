//
//  ViewController.swift
//  Segue
//
//  Created by home on 4/24/19.
//  Copyright © 2019 home. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let username = "lessonOne"
    let password = "23041019"
    var nameTextName = ""
    

    
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
    
    
    // Фунция скрытия клавиатуры по тапу на экране
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //Функция появления клавиатуры и смещения textField
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
    
    
    @IBAction func fogotPassOrUsernameAction(_ sender: Any) {
        
    }
    //  Функция передачи данных на второй вью-контроллер при нажатии на button
    @IBAction func resultFromPressButton(_ sender: Any) {
        self.nameTextName = userNameTextField.text!
        
        performSegue(withIdentifier: "resultSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! SecondViewController
        vc.recieveResult = self.nameTextName
    }
    

   
    

}

