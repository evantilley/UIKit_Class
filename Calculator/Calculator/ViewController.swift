//
//  ViewController.swift
//  Calculator
//
//  Created by Evan Tilley on 1/1/20.
//  Copyright © 2020 Evan Tilley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstText: UITextField!
    @IBOutlet weak var secondText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var result = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        
    }
    
    
    @IBAction func sumClicked(_ sender: Any) {
        if let firstNumber = Int(firstText.text!){ //check if can convert to int
            if let secondNumber = Int(secondText.text!){ //check if can convert to int
                
                result = firstNumber + secondNumber
                resultLabel.text = String(result) //set text field of result label
                
            }
        }
    }
    

    @IBAction func minusClicked(_ sender: Any) {
        if let firstNumber = Int(firstText.text!){
            if let secondNumber = Int(secondText.text!){
                
                result = firstNumber - secondNumber
                resultLabel.text = String(result)
            }
        }
    }
    
    
    @IBAction func multiplyClicked(_ sender: Any) {
        if let firstNumber = Int(firstText.text!){
            if let secondNumber = Int(secondText.text!){
                
                result = firstNumber * secondNumber
                resultLabel.text = String(result)
            }
        }
    }
    
    @IBAction func divideClicked(_ sender: Any) {
        if let firstNumber = Int(firstText.text!){
            if let secondNumber = Int(secondText.text!){
                
                result = firstNumber / secondNumber
                resultLabel.text = String(result)
            }
        }
    }
    
    
}


