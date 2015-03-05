//
//  ViewController.swift
//  music
//
//  Created by Simon Cronly-Dillon on 09/01/2015.
//  Copyright (c) 2015 dataclones. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBAction func changeVolume(sender: AnyObject) {
        
        player.volume = volumeSlider.value
    }
    
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBAction func stop(sender: AnyObject) {
        
        player.stop()
        player.currentTime = 0
    }
    
    @IBAction func play(sender: AnyObject) {
        
        player.play()
    }
    
    @IBAction func pause(sender: AnyObject) {
        
        player.pause()
        
    }
    var player:AVAudioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Where is music file
        
        var filelocation = NSString(string:NSBundle.mainBundle().pathForResource("03 The Jack", ofType: "mp3")!)
        
        var error: NSError? = nil
        
        player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: filelocation), error: &error)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

