//
//  ViewController.swift
//  Art Book
//
//  Created by Shivanshu Chaudhary on 14/07/17.
//  Copyright © 2017 Shivanshu Chaudhary. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    var nameArray = [String]()
    var yearArray = [Int]()
    var artistArray = [String]()
    var imageArray = [UIImage]()
    
    var selectedPainting = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        tableView.dataSource = self
        tableView.delegate = self
        retrieveInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Everytime the view is loaded
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.retrieveInfo), name: NSNotification.Name(rawValue:"paintingCreated"), object: nil)
    }
    
    
    
    func retrieveInfo(){
        self.nameArray.removeAll()
        self.artistArray.removeAll()
        self.yearArray.removeAll()
        self.imageArray.removeAll()
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
        
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0{
                for result in results as! [NSManagedObject]{
                    if let name = result.value(forKey: "name") as? String{
                        self.nameArray.append(name)
                    }
                    if let year = result.value(forKey: "year") as? Int{
                        self.yearArray.append(year)
                    }
                    if let artist = result.value(forKey: "artist") as? String{
                        self.artistArray.append(artist)
                    }
                    if let imageData = result.value(forKey: "image") as? Data{
                        let image = UIImage(data: imageData)
                        self.imageArray.append(image!)
                    }
                    self.tableView.reloadData()
                }
            }
        } catch {
            print("Error in retrieving")
        }
    }
    

    @IBAction func addButtonClicked(_ sender: Any) {
        self.selectedPainting = ""
        performSegue(withIdentifier: "toCreateVC", sender: nil)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedPainting = nameArray[indexPath.row]
        performSegue(withIdentifier: "toCreateVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCreateVC"{
            let destinationVC = segue.destination as! createVC
            destinationVC.chosenPainting = selectedPainting
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }
    
    
}

