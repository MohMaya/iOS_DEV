//
//  ViewController.swift
//  Landmark Image View
//
//  Created by Shivanshu Chaudhary on 14/07/17.
//  Copyright © 2017 Shivanshu Chaudhary. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNamesArray = [String]()
    var landmarkImageArray = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Table View Setup
        tableView.dataSource = self
        tableView.delegate = self
        
        //example array creation
        landmarkNamesArray.append("Brazil")
        landmarkNamesArray.append("Rome")
        landmarkNamesArray.append("England")
        landmarkNamesArray.append("Taipei")
        landmarkNamesArray.append("India")
        landmarkNamesArray.append("TowerBridge")
        
        landmarkImageArray.append(UIImage(named: "brazilchrist.jpg")!)
        landmarkImageArray.append(UIImage(named: "colloseum.jpg")!)
        landmarkImageArray.append(UIImage(named: "london.jpg")!)
        landmarkImageArray.append(UIImage(named: "TaipeiTower.jpg")!)
        landmarkImageArray.append(UIImage(named: "TajMahal.jpg")!)
        landmarkImageArray.append(UIImage(named: "towerbridge.jpg")!)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNamesArray.count
    }
    
    //Making data editable(Deleting) by swiping
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landmarkNamesArray.remove(at: indexPath.row)
            landmarkImageArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.chosenLandmarkName = landmarkNamesArray[indexPath.row]
        self.chosenLandmarkImage = landmarkImageArray[indexPath.row]
        performSegue(withIdentifier: "toImageVCSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageVCSegue"{
            let destinationVC = segue.destination as! ImageViewController
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNamesArray[indexPath.row]
        return cell
        
    }
    

}

