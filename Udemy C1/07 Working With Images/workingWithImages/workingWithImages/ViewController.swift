//
//  ViewController.swift
//  workingWithImages
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
    }

    @IBAction func nextButtonClicked(_ sender: Any) {
        if counter == 0{
            imageView.image = UIImage(named: "Pikachu.png")
            pokeName.text = "Pikachu"
            counter = 1
        }else if counter == 1{
            imageView.image = UIImage(named: "Charmander.png")
            pokeName.text = "Charmander"
            counter = 2
        }else if counter == 2{
            imageView.image = UIImage(named: "Bulbasaur.png")
            pokeName.text = "Bulbasaur"
            counter = 0
        }
    }
    
    @IBAction func chooseButtonClicked(_ sender: Any) {
        print("\(pokeName.text!) Selected")
    }

}

