//
//  ViewController.swift
//  simpson character book
//
//  Created by Shivanshu Chaudhary on 14/07/17.
//  Copyright © 2017 Shivanshu Chaudhary. All rights reserved.
//

import UIKit

class tableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var mysimpsons = [Simpson]()
    var chosenSimpson = Simpson()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Tableview setup
        tableView.delegate = self
        tableView.dataSource = self
        
        
        //creating our characters
        
        let homer = Simpson()
        homer.name = "Homer Simpson"
        homer.occupation = "Safety Manager"
        homer.image = UIImage(named: "homer.png")!
        
        let bart = Simpson()
        bart.name = "Bart Simpson"
        bart.occupation = "Student"
        bart.image = UIImage(named: "bart.png")!
        
        let lisa = Simpson()
        lisa.name = "Lisa Simpson"
        lisa.occupation = "Student"
        lisa.image = UIImage(named: "lisa.png")!
        
        let maggie = Simpson()
        maggie.name = "Maggie Simpson"
        maggie.occupation = "Infant"
        maggie.image = UIImage(named: "maggie.png")!
        
        let marge = Simpson()
        marge.name = "Marge Simpson"
        marge.occupation = "Homer Maker"
        marge.image = UIImage(named: "marge.png")!
        
        let ned = Simpson()
        ned.name = "Ned Flanders"
        ned.occupation = "Pharmacist"
        ned.image = UIImage(named: "ned.png")!
        
        mysimpsons.append(homer)
        mysimpsons.append(bart)
        mysimpsons.append(lisa)
        mysimpsons.append(maggie)
        mysimpsons.append(marge)
        mysimpsons.append(ned)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mysimpsons.count
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedSimpson = self.chosenSimpson
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.chosenSimpson = mysimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mysimpsons[indexPath.row].name
        
        return cell
    }

    
}

