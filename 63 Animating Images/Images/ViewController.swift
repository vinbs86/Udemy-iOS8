//
//  ViewController.swift
//  Images
//
//  Created by Simon Cronly-Dillon on 30/12/2014.
//  Copyright (c) 2014 dataclones. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = NSTimer() // Declare timer for viewDidLoad
    var show: Bool = false
    
    @IBOutlet weak var alien: UIImageView!
    
    var counter = 1
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
    show = !show
        println(show)
    
        if (show == true) {
            
            // Timer to tick through frames by calling "result" every 0.2 sec
            timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
            
        } else {
            timer.invalidate()
        }

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func result() {
        
        counter++
        
        if (counter==5 ) {
            
            counter = 1
        }
        
        alien.image = UIImage(named: "frame\(counter).png")
        // bring integer into String with \ backslash
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewDidLayoutSubviews() {
        
        alien.frame = CGRectMake(0,0,0,0)
        
        // x, y, width, height
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // Over 4 secs - make it appear to resize and reposition
        UIView.animateWithDuration(4, animations: {
            
            self.alien.frame = CGRectMake(140,250,100,200)
            
            // end x, y, width, height
            
            
        })
    }
    
    

 /*
    override func viewDidLayoutSubviews() {
        
        alien.center = CGPointMake(alien.center.x - 400, alien.center.y)
        
        // Move start point o graphic off to left
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // Over 1 second - add +400 to the x coordinate
        UIView.animateWithDuration(1, animations: {
            self.alien.center = CGPointMake(self.alien.center.x + 400, self.alien.center.y)
        })
    }
*/
    
/*
    override func viewDidLayoutSubviews() {
        
        alien.alpha = 0
        
        // Make image transparent
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // Over 10 seconds - make image solid
        UIView.animateWithDuration(10, animations: {
            
            self.alien.alpha = 1
        })
    }
*/
  
/*
    override func viewDidLayoutSubviews() {
        
        alien.frame = CGRectMake(100,20,0,0)
        
        // x, y, width, height
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // Over 4 secs - make it appear to zoom
        UIView.animateWithDuration(4, animations: {
        
            self.alien.frame = CGRectMake(100,20,100,200)
            
            // x, y, width, height

        
        })
    }
*/
    
    
}

