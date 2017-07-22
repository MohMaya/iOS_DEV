//
//  FirstViewController.swift
//  Firebase Instagram Clone
//
//  Created by Shivanshu Chaudhary on 15/07/17.
//  Copyright © 2017 Shivanshu Chaudhary. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func logOutButtonClicked(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "usersigned")
        UserDefaults.standard.synchronize()
        
        let signUp = self.storyboard?.instantiateViewController(withIdentifier: "signUpVC") as! signUpVC
        let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        delegate.window?.rootViewController = signUp
        delegate.rememberLogin()
    }

}

