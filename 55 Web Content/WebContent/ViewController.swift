//
//  ViewController.swift
//  WebContent
//
//  Created by Simon Cronly-Dillon on 21/12/2014.
//  Copyright (c) 2014 dataclones. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var url = NSURL(string:"http://forges.com")
        
       
        // Will use let as we are creating an inmutable object\
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!){(data, response, error) in
            
            println(NSString(data: data, encoding:NSUTF8StringEncoding))
        }
        
        task.resume()
        //Actually runs the task defined above - data
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

