//
//  signUpVC.swift
//  Firebase Instagram Clone
//
//  Created by Shivanshu Chaudhary on 15/07/17.
//  Copyright © 2017 Shivanshu Chaudhary. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class signUpVC: UIViewController {

    
    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        
        if usernameText.text != "" && passwordText.text != ""{
            Auth.auth().signIn(withEmail: usernameText.text!, password: passwordText.text!, completion: { (user, error) in
                if error != nil{
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                    alert.addAction(ok)
                    self.present(alert, animated: true, completion: nil)
                }else{
                    self.performSegue(withIdentifier: "toTabBarSegue", sender: nil)
                }
            })
        }
        
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        if usernameText.text != "" && passwordText.text != ""{
            Auth.auth().createUser(withEmail: usernameText.text!, password: passwordText.text!, completion: { (user, error) in
                if error != nil{
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                    alert.addAction(ok)
                    self.present(alert, animated: true, completion: nil)
                }else{
                    self.performSegue(withIdentifier: "toTabBarSegue", sender: nil)
                }
            })
            
            
        }else{
            let alert = UIAlertController(title: "Error", message: "Provide an email and password", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
    }

}
