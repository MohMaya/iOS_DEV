//
//  ViewController.swift
//  Timer
//
//  Created by Shivanshu Chaudhary on 13/07/17.
//  Copyright © 2017 Shivanshu Chaudhary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        counter = 10
        timerLabel.text = String(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timerFunction), userInfo: nil, repeats: true)
    }

    func timerFunction(){
        //Function For Timer
        timerLabel.text = String(counter)
        counter = counter - 1
        if(counter == 0){
            timer.invalidate()
            timerLabel.text = "Time's UP"
        }
    }
    
}

