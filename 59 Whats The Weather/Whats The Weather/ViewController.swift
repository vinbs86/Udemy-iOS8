//
//  ViewController.swift
//  Whats The Weather
//
//  Created by Simon Cronly-Dillon on 23/12/2014.
//  Copyright (c) 2014 dataclones. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var city: UITextField!
    
    @IBOutlet weak var message: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        self.view.endEditing(true)
        
        //Goto the webpage we want
        var urlString = "http://www.weather-forecast.com/locations/" + city.text.stringByReplacingOccurrencesOfString(" ", withString: "") + "/forecasts/latest"
                                                                                // remove any spaces
        
        println(urlString)
        
        var url = NSURL(string: urlString)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            
            var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
            
           let tempurlContent: String = urlContent as String
            // Downcast NSString as String
            
            //if ((tempurlContent as String).containsString("<span class=\"phrase\">")) {
            if (tempurlContent.rangeOfString("<span class=\"phrase\">") != nil) {
            // Only try to scrape the weather if the city is a valid url
                
            // Grab the part of the web page code we want
            var contentArray = urlContent!.componentsSeparatedByString("<span class=\"phrase\">")
                                                                        // Backslash \ before " to escape the quotes so " is part of the string
            var newContentArray = contentArray[1].componentsSeparatedByString("</span")
            // takes the text up to the next 'span'

            
            dispatch_async(dispatch_get_main_queue()) {
                
                // speeds up display in app by stopping asyn processes
            
            //self.message.text = newContentArray[0] as? String
            self.message.text = newContentArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º") as String
            // self added as it is within the curly brackets enclosure
            // downcast normal string to NSString with as string
            // replaced dodgey characters
            }
            
            println(self.message.text)
            
            } else {
            
            
            self.message.text = "City not found - please try again"
                
            }
            
        }
        
        task.resume()
        
        
        
    }
}
