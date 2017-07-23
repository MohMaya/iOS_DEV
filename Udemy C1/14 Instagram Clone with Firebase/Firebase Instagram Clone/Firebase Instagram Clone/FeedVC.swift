//
//  FirstViewController.swift
//  Firebase Instagram Clone
//
//  Created by Shivanshu Chaudhary on 15/07/17.
//  Copyright © 2017 Shivanshu Chaudhary. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var userNameArray = [String]()
    var postTextArray = [String]()
    var postImageURLArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        getDataFromServer()
    }
    
    
    func getDataFromServer(){
        Database.database().reference().child("users").observe(DataEventType.childAdded, with: { (snapshot) in
            
            let values = snapshot.value! as! NSDictionary
            //casts the snapshot as a dictionary
            
            let posts = values["posts"]! as! NSDictionary
            //force cast the posts as a dictionary type with KEY as the postID
            //and VALUE as the dictionary of image, posttext, postedby, etc.

            let postIDs = posts.allKeys
            
            for id in postIDs{
                let singlePost = posts[id] as! NSDictionary
                //A dictionary with KEY as image, posttext, postedby, etc.
                //VALUE as corresponding data
                
                self.userNameArray.append(singlePost["postedby"] as! String)
                self.postTextArray.append(singlePost["posttext"] as! String)
                self.postImageURLArray.append(singlePost["image"] as! String)
                
            }
            self.tableView.reloadData()
            
            
            
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userNameArray.count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //returning a cell created on the basis of the prototype cell defined in storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! feedCell
        //Whatever is put in the prototype cell as an object, it can be reached to by feedVC
        //All the behavior and structure of the cell and its element are defined in feedCell.swift which is of type UIViewCell
        cell.postText.text = postTextArray[indexPath.row]
        cell.userName.text = userNameArray[indexPath.row]
        cell.postImage.sd_setImage(with: URL(string: self.postImageURLArray[indexPath.row]))
        return cell
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

