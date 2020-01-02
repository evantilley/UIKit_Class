//
//  ViewController.swift
//  TimerProject
//
//  Created by Evan Tilley on 1/2/20.
//  Copyright © 2020 Evan Tilley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    var timer = Timer()
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        counter = 10
        timeLabel.text = "Time: \(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }
    
    @objc func timerFunction(){
        timeLabel.text = "Time: \(counter)"
        counter -= 1
        
        if counter == 0{
            timer.invalidate() //stop timer
            timeLabel.text = "Time's Up"
        }
        
    }
    

    @IBAction func buttonClicked(_ sender: Any) {
        print("Button clicked")
    }
    
}

