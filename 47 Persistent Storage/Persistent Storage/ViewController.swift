//
//  ViewController.swift
//  Persistent Storage
//
//  Created by Simon Cronly-Dillon on 16/12/2014.
//  Copyright (c) 2014 dataclones. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //NSUserDefaults.standardUserDefaults().setObject("Rob", forKey: "myName")
        
        //NSUserDefaults.standardUserDefaults().synchronize()
        
        println(NSUserDefaults.standardUserDefaults().objectForKey("myName")!)   // Optional added at end to fix log output
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

