//
//  ViewController.swift
//  Shake for Sounds
//
//  Created by Simon Cronly-Dillon on 12/01/2015.
//  Copyright (c) 2015 dataclones. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //var player:AVAudioPlayer = AVAudioPlayer()
    var player = AVAudioPlayer()
    // Create empty audio player
    
    
    var soundArray = ["bean", "fart", "belch", "giggle", "pew", "pig", "snore", "static"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //var fileLocation = NSString(string:NSBundle.mainBundle().pathForResource("sounds/bean", ofType: "mp3")!)
        
        //var error:NSError? = nil
        
        //player = AVAudioPlayer(contentsOfURL: NSURL(string: fileLocation), error: &error)
        //player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation), error: &error)
        
        //player.play()
    
    }
    
    
    // SHAKES
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        
        if event.subtype == UIEventSubtype.MotionShake {
            println("YOU SHOOK ME")
            
            var randomNumber = Int(arc4random_uniform(UInt32(soundArray.count)))
            
            println(randomNumber)
            
            var soundFiles = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(soundArray[randomNumber], ofType: "mp3")!)
            
            var error:NSError?
            
            player = AVAudioPlayer(contentsOfURL: soundFiles, error: &error)
            
            //player.prepareToPlay()
            player.play()
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated
    }
}