//
//  ViewController.swift
//  Very First App
//
//  Created by Shivanshu Chaudhary on 27/06/17.
//  Copyright © 2017 Shivanshu Chaudhary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Image: UIImageView!
    
    
    @IBOutlet weak var labelWalter: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeButton(_ sender: Any) {
        labelWalter.text = "Heisenberg"
    }
    
}

