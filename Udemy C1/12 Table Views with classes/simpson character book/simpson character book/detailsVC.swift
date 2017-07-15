//
//  detailsVC.swift
//  simpson character book
//
//  Created by Shivanshu Chaudhary on 14/07/17.
//  Copyright © 2017 Shivanshu Chaudhary. All rights reserved.
//

import UIKit

class detailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var occupationLabel: UILabel!
    
    var selectedSimpson = Simpson()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameLabel.text = selectedSimpson.name
        occupationLabel.text = selectedSimpson.occupation
        imageView.image = selectedSimpson.image
        
    }

    

}
