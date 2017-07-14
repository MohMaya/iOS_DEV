//
//  ViewController.swift
//  Catch The Kenny
//
//  Created by Shivanshu Chaudhary on 13/07/17.
//  Copyright © 2017 Shivanshu Chaudhary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var kenny1: UIImageView!
    
    @IBOutlet weak var kenny2: UIImageView!
    
    @IBOutlet weak var kenny3: UIImageView!
    
    @IBOutlet weak var kenny4: UIImageView!
    
    @IBOutlet weak var kenny5: UIImageView!
    
    @IBOutlet weak var kenny6: UIImageView!
    
    @IBOutlet weak var kenny7: UIImageView!
    
    @IBOutlet weak var kenny8: UIImageView!
    
    @IBOutlet weak var kenny9: UIImageView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var highScoreLabel: UILabel!
    
    var score = 0
    
    var highScore = 0
    
    var counter = 0
    
    var timeLimit = 30
    
    var timer = Timer()
    
    var hideTimer = Timer()
    
    var kennyArray = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        //Check the highscore
        let highScore = UserDefaults.standard.object(forKey: "highscore")
        
        if highScore == nil{
            highScoreLabel.text = "0"
        }
        
        if let newScore = highScore as? Int{
            highScoreLabel.text = String(newScore)
        }
        
        
        scoreLabel.text = "Score : \(score)"
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        kenny1.addGestureRecognizer(recognizer1)
        kenny1.isUserInteractionEnabled = true
        
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        kenny2.addGestureRecognizer(recognizer2)
        kenny2.isUserInteractionEnabled = true
        
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        kenny3.addGestureRecognizer(recognizer3)
        kenny3.isUserInteractionEnabled = true
        
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        kenny4.addGestureRecognizer(recognizer4)
        kenny4.isUserInteractionEnabled = true
        
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        kenny5.addGestureRecognizer(recognizer5)
        kenny5.isUserInteractionEnabled = true
        
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        kenny6.addGestureRecognizer(recognizer6)
        kenny6.isUserInteractionEnabled = true
        
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        kenny7.addGestureRecognizer(recognizer7)
        kenny7.isUserInteractionEnabled = true
        
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        kenny8.addGestureRecognizer(recognizer8)
        kenny8.isUserInteractionEnabled = true
        
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        kenny9.addGestureRecognizer(recognizer9)
        kenny9.isUserInteractionEnabled = true
        
        counter = timeLimit
        timeLabel.text = String(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
        
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.hideKenny), userInfo: nil, repeats: true)
        
        //creating Array
        kennyArray.append(kenny1)
        kennyArray.append(kenny2)
        kennyArray.append(kenny3)
        kennyArray.append(kenny4)
        kennyArray.append(kenny5)
        kennyArray.append(kenny6)
        kennyArray.append(kenny7)
        kennyArray.append(kenny8)
        kennyArray.append(kenny9)
        
        hideKenny()
    }
    
    func countDown(){
        counter -= 1
        timeLabel.text = String(counter)
        if counter == 0{
            timer.invalidate()
            hideTimer.invalidate()
            
            //Checking highscores here
            if self.score > Int(highScoreLabel.text!)!{
                UserDefaults.standard.set(self.score, forKey: "highscore")
                highScoreLabel.text = String(self.score)
            }
            
            
            
            //Alert creation
            let alert = UIAlertController(title: "Time", message: "Time's UP", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            alert.addAction(ok)
            
            
            let replay = UIAlertAction(title: "Replay", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
                self.score = 0
                self.counter = self.timeLimit
                self.scoreLabel.text = "Score: \(self.score)"
                self.timeLabel.text = "\(self.counter)"
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.hideKenny), userInfo: nil, repeats: true)
            })
            alert.addAction(replay)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func hideKenny(){
        //Hiding kenny
        for kenny in kennyArray{
            kenny.isHidden = true
        }
        
        let randomNumber = Int(arc4random_uniform(UInt32(kennyArray.count-1)))
        kennyArray[randomNumber].isHidden = false
    }
    
    
    func increaseScore(){
        //When Recognizers get caught ot Kenny is tapped
        score += 1
        scoreLabel.text = "Score : \(score)"
    }
    
}

