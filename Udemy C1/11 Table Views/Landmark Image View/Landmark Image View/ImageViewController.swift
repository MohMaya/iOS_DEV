//
//  ImageViewController.swift
//  Landmark Image View
//
//  Created by Shivanshu Chaudhary on 14/07/17.
//  Copyright © 2017 Shivanshu Chaudhary. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ImageView.image = selectedLandmarkImage
        nameLabel.text = selectedLandmarkName
    }

    
}
