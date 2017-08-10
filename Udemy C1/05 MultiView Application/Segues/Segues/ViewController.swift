//
//  ViewController.swift
//  Segues
//
//  Created by Shivanshu Chaudhary on 13/07/17.
//  Copyright © 2017 Shivanshu Chaudhary. All rights reserved.
//

import UIKit

class ViewController : UIViewController{

    @IBOutlet weak var nameText: UITextField!
    var name = "Stranger"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "oneToTwo"{
            let destinationVC = segue.destination as! ViewController2
            destinationVC.username = name
        }
    }
    
    @IBAction func saveBtnClicked(_ sender: Any) {
        name = nameText.text!
        performSegue(withIdentifier: "oneToTwo", sender: nil)
    }
    


}

