//
//  ViewController.swift
//  SegueApp
//
//  Created by Evan Tilley on 1/2/20.
//  Copyright © 2020 Evan Tilley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userName = ""

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var nameText: UITextField!
    
    
    //gets code before the user sees the view
    //only gets called when the app is launched
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad function called")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear function called")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear function called")
        nameText.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear function called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear function called")
    }

    //for button on top; button on bottom was linked without code
    @IBAction func nextClicked(_ sender: Any) {
        userName = nameText.text!
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //second ViewController is the destination
        if segue.identifier == "toSecondVC"{
            
            let destinationVC = segue.destination as! SecondViewController //casting/force unwrapping
            //we now have the second ViewController as a variable
            destinationVC.myName = userName
            
        }
    }
}

