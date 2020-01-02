//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Evan Tilley on 1/1/20.
//  Copyright © 2020 Evan Tilley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //load saved values
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        //optional casting with if-let
        if let newName = storedName as? String{
            nameLabel.text = "Name: \(newName)" //set nameLabel text to saved value
        }
        
        if let newBirthday = storedBirthday as? String{
            birthdayLabel.text = "Birthday: \(newBirthday)" //set birthdayLabel text to saved value
        }
        
    }

    @IBAction func saveClicked(_ sender: Any) {
        
        //saves data in nameTextField and birthdayTextField
        UserDefaults.standard.set(nameTextField.text!, forKey: "name")
        UserDefaults.standard.set(birthdayTextField.text!, forKey: "birthday")
        UserDefaults.standard.synchronize() //this is uncessary
        
        
        nameLabel.text = "Name: \(nameTextField.text!)" //force unwrapping
        birthdayLabel.text = "Birthday: \(birthdayTextField.text!)"
        
    }
    
    
    @IBAction func deleteClicked(_ sender: Any) {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name: "
        }
        
        if (storedBirthday as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday: "
        }
        
    }
    
}

