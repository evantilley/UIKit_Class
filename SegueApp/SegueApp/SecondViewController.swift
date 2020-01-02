//
//  SecondViewController.swift
//  SegueApp
//
//  Created by Evan Tilley on 1/2/20.
//  Copyright © 2020 Evan Tilley. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var myLabelSecond: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var myName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameLabel.text = myName
        
    }
    

}
