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
    
    var recieveResult = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultTextField.text = recieveResult
        
    }
    
    


}
