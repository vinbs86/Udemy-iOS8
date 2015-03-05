//
//  ViewController.swift
//  JSON demo 90
//
//  Created by Simon Cronly-Dillon on 16/01/2015.
//  Copyright (c) 2015 dataclones. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlPath="http://www.telize.com/geoip"
        
        let url = NSURL(string: urlPath)
        
        let session = NSURLSession.sharedSession()
        
        //Task within session
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            
            if (error != nil) {
                
                println(error)

            } else {
                
                // Create a Dictionary with our JSON download
                let jsonResult =  NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
                
                println(jsonResult)
                
                // Item with key 'country'
                println(jsonResult["country"]!)
                

            }
            
            })
        // EXECUTE TASK
        task.resume()
    }
}