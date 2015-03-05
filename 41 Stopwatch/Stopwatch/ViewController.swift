//
//  ViewController.swift
//  Stopwatch
//
//  Created by Simon Cronly-Dillon on 11/12/2014.
//  Copyright (c) 2014 dataclones. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerDisplay: UILabel!
    
    @IBAction func stopStartButton(sender: AnyObject) {
        startStop = !startStop

    }
   
    @IBAction func clearButton(sender: AnyObject) {
        startStop = false
        counter = 0
    }
    
    var counter:Int = 0
    var startStop = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        
    }
    
    func result() {
        if (startStop == true) {
            counter = counter+1
        } else {
            //seconds = 0
        }
        timerDisplay.text = "\(counter)"
        println(counter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

