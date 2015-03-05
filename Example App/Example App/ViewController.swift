//
//  ViewController.swift
//  Example App
//
//  Created by Simon Cronly-Dillon on 09/12/2014.
//  Copyright (c) 2014 dataclones. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        println("Hello World! ")
        
        myLabel.text="It Worked!"
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

