//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Evan Tilley on 1/1/20.
//  Copyright © 2020 Evan Tilley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClicked(_ sender: Any) {
        
        imageView.image = UIImage(named: "metallica2")
        
    }
    
}

