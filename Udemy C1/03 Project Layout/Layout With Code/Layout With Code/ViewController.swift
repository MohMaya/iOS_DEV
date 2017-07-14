//
//  ViewController.swift
//  Layout With Code
//
//  Created by Shivanshu Chaudhary on 13/07/17.
//  Copyright © 2017 Shivanshu Chaudhary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let myButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let width = view.frame.size.width
        let height = view.frame.size.height //Rather than harcoding, dynamically knowing the value for different devices
        
        let myLabel = UILabel()
        myLabel.text = "My Coded Label!"
        myLabel.textAlignment = NSTextAlignment.center
        //Or myLabel.textAlignment = .center
        myLabel.frame = .init(x: width * 0.1, y: height * 0.3 , width: width * 0.8, height: 50)
        view.addSubview(myLabel)
        
        
        //Adding Buttons with Code
        //Can Be Done here or outside viewDidLoad()
        //let myButton = UIButton()
        myButton.frame = CGRect(x: width * 0.2, y: height * 0.5, width: width * 0.6, height: 50)
        myButton.setTitle("My Coded Button", for: UIControlState.normal)
        myButton.setTitleColor(UIColor.darkGray , for: UIControlState.normal)
        view.addSubview(myButton)
        myButton.addTarget(self, action: #selector(ViewController.myAction), for: UIControlEvents.touchUpInside)
        //self =>viewController
    }
    
    func myAction(){
        print("You Have Clicked The Button")
        self.myButton.setTitleColor(UIColor.blue, for: UIControlState.normal)
    }
    
    
    
    

    


}

