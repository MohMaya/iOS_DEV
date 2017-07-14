//
//  ViewController2.swift
//  Segues
//
//  Created by Shivanshu Chaudhary on 13/07/17.
//  Copyright © 2017 Shivanshu Chaudhary. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var greetingsText: UILabel!
    
    var username = "Stranger"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        greetingsText.text = "Hello \(username) !"
        
    }

    @IBAction func backBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
