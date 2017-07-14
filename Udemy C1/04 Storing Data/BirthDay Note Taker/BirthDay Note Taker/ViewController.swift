//
//  ViewController.swift
//  BirthDay Note Taker
//
//  Created by Shivanshu Chaudhary on 13/07/17.
//  Copyright © 2017 Shivanshu Chaudhary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var birthdayText: UITextField!
    
    @IBOutlet weak var storedNameLabel: UILabel!
    
    @IBOutlet weak var storedDataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedDate = UserDefaults.standard.object(forKey: "birthday")
        
        if let newName = storedName as? String{//If a new constant: newName can be created using storedName as String
            storedNameLabel.text = "Stored Name : \(newName)"
        }
        
        if let newDate = storedDate as? String{
            storedDataLabel.text = "Stored Date : \(newDate)"
        }
        
    }

    @IBAction func saveButtonClicked(_ sender: Any) {
        
        let userDefault = UserDefaults.standard
        userDefault.setValue(nameText.text!, forKey: "name")
        userDefault.setValue(birthdayText.text!, forKey: "birthday")
        userDefault.synchronize()
        
        storedNameLabel.text = "Stored Name : \(nameText.text!)"
        storedDataLabel.text = "Stored Date : \(birthdayText.text!)"
    }
    
    
    @IBAction func deleteButtonClicked(_ sender: Any) {
        //first check if data is stored or not
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedDate = UserDefaults.standard.object(forKey: "birthday")
        
        if let _ = storedName as? String{//If a new constant: newName can be created using storedName as String
            UserDefaults.standard.removeObject(forKey: "name")
            UserDefaults.standard.synchronize()
            storedNameLabel.text = "Stored Name :"
        }
        
        if let _ = storedDate as? String{
            UserDefaults.standard.removeObject(forKey: "birthday")
            UserDefaults.standard.synchronize()
            storedDataLabel.text = "Stored Date :"
        }
        
        

    }
    
    
}

