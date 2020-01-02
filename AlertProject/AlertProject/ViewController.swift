//
//  ViewController.swift
//  AlertProject
//
//  Created by Evan Tilley on 1/2/20.
//  Copyright © 2020 Evan Tilley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmPasswordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpClicked(_ sender: Any) {

        
        //username missing
        if usernameText.text == ""{
            makeAlert(titleInput: "Error", messageInput: "Username missing")
        } else if passwordText.text == ""{
            makeAlert(titleInput: "Error", messageInput: "Password missing")
        } else if passwordText.text != confirmPasswordText.text{
            makeAlert(titleInput: "Error", messageInput: "Passwords don't match")
        } else{
            makeAlert(titleInput: "Success", messageInput: "User Created")
        }
        
    }
    
    func makeAlert(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

