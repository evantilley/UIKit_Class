//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Evan Tilley on 1/2/20.
//  Copyright © 2020 Evan Tilley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    var isJames = true //first pic boolean
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //lets user interact with the image
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        
        imageView.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func changePic(){
        
        if isJames == true{
            imageView.image = UIImage(named: "ulrich")
            myLabel.text = "Lars Ulrich"
            isJames = false
        } else{
            imageView.image = UIImage(named: "hetfield")
            myLabel.text = "James Hetfield"
            isJames = true
        }
        
        

        
    }


}

