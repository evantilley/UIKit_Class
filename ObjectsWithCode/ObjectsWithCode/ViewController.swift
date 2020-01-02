//
//  ViewController.swift
//  ObjectsWithCode
//
//  Created by Evan Tilley on 1/1/20.
//  Copyright © 2020 Evan Tilley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //place myLabel here so it is reachable from all functions in class
    var myLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let width = view.frame.size.width //width of current screen
        let height = view.frame.size.height //height of current screen
        
        myLabel.text = "Test Label"
        myLabel.textAlignment = .center
        myLabel.frame = CGRect(x: width * 0.5 - width * 0.8 / 2, y: height * 0.5 - 50 / 2, width: width * 0.8, height: 50) //location of myLabel
        view.addSubview(myLabel) //add myLabel to view
        
        //Button object
        let myButton = UIButton()
        myButton.setTitle("My Button", for: UIControl.State.normal) //normal state/mode
        myButton.setTitleColor(UIColor.blue, for: UIControl.State.normal) //button is blue in normal state
        myButton.frame = CGRect(x: width * 0.5 - (200 / 2), y: height * 0.7, width: 200, height: 100)
        view.addSubview(myButton) //add myButton to view
        
        //self refers to ViewController itself
        //call a function as as an action whenever the button is touched
        //action should be in the target (self), e.g. myAction function should be in self
        myButton.addTarget(self, action: #selector(ViewController.myAction), for: UIControl.Event.touchUpInside)
        
    }
    
    //an objective-C function that can be called as a selctor
    @objc func myAction(){
        myLabel.text = "Tapped"
        
    }


}

