//
//  ViewController.swift
//  Storing Images
//
//  Created by Simon Cronly-Dillon on 15/01/2015.
//  Copyright (c) 2015 dataclones. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // *** DOWNLOAD IMAGE ***
/*
        let url = NSURL(string: "http://static1.squarespace.com/static/5370be4ee4b074a1fbd0735b/t/54633366e4b003a2863f50e8/1416611226646/dataclonesNewbyBorder.png?format=750w")
        
        let urlRequest = NSURLRequest(URL: url!)
        
        //Asynchronous connection - multithreading - allows
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue(), completionHandler: {
            
            response, data, error in
            
            if error != nil {
                println("There was an error")
            } else {
                
                let image = UIImage(data: data)
                
                //self.myImage.image = image
                
        
        // *** SAVE IMAGE ***
        
        
                // Initially it is empty so it is an Optional
                var documentsDirectory:String?
                
                var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                
                if paths.count > 0 {
                    
                    //Use the first item in the array
                    documentsDirectory = paths[0] as? String
                    
                    var savePath = documentsDirectory! + "/dataclonesLogo.jpg"
                    
                    // Save at the path
                    NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                    
                    self.myImage.image = UIImage(named: savePath)
                    
                    
                }
            }
            
            
        })
*/
        
        // ** GRAB SAVED IMAGE ***
        
        
        var documentsDirectory:String?
        
        var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
        if paths.count > 0 {
            
            documentsDirectory = paths[0] as? String
            
            var savePath = documentsDirectory! + "/dataclonesLogo.jpg"
            
            self.myImage.image = UIImage(named: savePath)

        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

