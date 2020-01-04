//
//  ViewController.swift
//  DarkMode
//
//  Created by Evan Tilley on 1/3/20.
//  Copyright © 2020 Evan Tilley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var changeButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       // overrideUserInterfaceStyle = .light //makes the app in light mode, regardless of user settings
        //or, can modify in Info.plist - see Info.plist to ovverride display mode for entire app
        

    }
    

    //called when a user changes traits
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        if userInterfaceStyle == .dark{
            //make button white if phone is in dark mode
            changeButton.tintColor = UIColor.white
        } else{
            changeButton.tintColor = UIColor.blue
        }
    }


}

