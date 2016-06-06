//
//  ViewController.swift
//  Tap me
//
//  Created by Addiel on 06/06/16.
//  Copyright © 2016 Addiel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    var count = 0
    var seconds = 0
    var timer = NSTimer()
    
    func subtractTime()  {
        seconds = seconds-1
        timeLabel.text = "Time: \(seconds)"
        
        if seconds == 0 {
            timer.invalidate()
            let alert = UIAlertController(title: "Time is up!",
                                          message: "You scored \(count) points",
                                          preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: {
                action in self.setupGame()
            }))
            presentViewController(alert, animated: true, completion:nil)
        }
        
    }
    
    func setupGame(){
        seconds = 30
        count = 0
        scoreLabel.text = "Score: \(count)"
        timeLabel.text = "Time: \(seconds)"
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: #selector(ViewController.subtractTime),userInfo: nil, repeats: true)
    }
    
    
    @IBAction func buttonPressed(){
        print("test")
        count = count+1
        scoreLabel.text = "Score \(count)"
        print(count)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGame()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

