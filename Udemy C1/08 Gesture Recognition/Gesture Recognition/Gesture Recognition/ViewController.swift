//
//  ViewController.swift
//  Gesture Recognition
//
//  Created by Shivanshu Chaudhary on 13/07/17.
//  Copyright © 2017 Shivanshu Chaudhary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var pokeName: UILabel!
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.nextPoke))
        imageView.addGestureRecognizer(gestureRecognizer)
    }

    func nextPoke(){
        if counter == 0{
            //Change to Pikachu
            imageView.image = UIImage(named: "Pikachu.png")
            pokeName.text = "Pikachu"
            counter = 1
        }else if counter == 1{
            //Change to Charmender
            imageView.image = UIImage(named: "Charmander.png")
            pokeName.text = "Charmander"
            counter = 2
        }else if counter == 2{
            //Change Back to Bulbasaur
            imageView.image = UIImage(named: "Bulbasaur.png")
            pokeName.text = "Bulbasaur"
            counter = 0
        }
    }
    
}

