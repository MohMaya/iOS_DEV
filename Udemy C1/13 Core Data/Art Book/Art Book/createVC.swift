//
//  createVC.swift
//  Art Book
//
//  Created by Shivanshu Chaudhary on 15/07/17.
//  Copyright © 2017 Shivanshu Chaudhary. All rights reserved.
//

import UIKit
import CoreData

class createVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var artistText: UITextField!
    
    @IBOutlet weak var yearText: UITextField!
    
    var chosenPainting = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if chosenPainting != ""{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            
            fetchRequest.predicate = NSPredicate(format: "name = %@", self.chosenPainting)
            
            do {
                let results = try context.fetch(fetchRequest)
                if results.count > 0{
                    for result in results as! [NSManagedObject]{
                        if let name = result.value(forKey: "name") as? String{
                            nameText.text = name
                        }
                        
                        if let year = result.value(forKey: "year") as? Int{
                            yearText.text = String(year)
                        }
                        
                        if let artist = result.value(forKey: "artist") as? String{
                            artistText.text = artist
                        }
                        
                        if let imageData = result.value(forKey: "image") as? Data{
                            let image = UIImage(data: imageData)
                            imageView.image = image
                            
                        }
                    }
                }
            } catch {
                print("Error")
            }
        }else{
            imageView.image = UIImage(named: "TapMe.png")
            nameText.text = ""
            artistText.text = ""
            yearText.text = ""
        }
        
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(createVC.selectImage))
        
        imageView.addGestureRecognizer(gestureRecognizer)
    }

    func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        
        let newArt = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context!)
        
        newArt.setValue(nameText.text, forKey: "name")
        newArt.setValue(artistText.text, forKey: "artist")
        
        
        if let year = Int(yearText.text!){
                newArt.setValue(year, forKey: "year")
        }
        
        
        
        //Now Inserting Image
        let data = UIImageJPEGRepresentation(imageView.image!, 0.5)//0.5 is the compression ratio
        newArt.setValue(data,forKey: "image")
        
        
        do {
            try context?.save()
            print("Successfully saved!")
        } catch {
            print("Error")
        }
        
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "paintingCreated"), object: nil)
        _ = self.navigationController?.popViewController(animated: true)
        
        
    }
    
}
