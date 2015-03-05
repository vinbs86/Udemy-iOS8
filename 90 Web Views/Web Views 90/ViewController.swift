//
//  ViewController.swift
//  Web Views 90
//
//  Created by Simon Cronly-Dillon on 16/01/2015.
//  Copyright (c) 2015 dataclones. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create URL for page to import
        
        var url = NSURL(string: "http://elpais.com/autor/antonio_fraguas_forges/")
        
        // Just request the url
        var request = NSURLRequest(URL: url!)
        
        // Set webView to load request
        webView.loadRequest(request)
        /*
        // OR to run HTML in a webView
        
        var html = "<html><head></head><body><h1>Hello World!</h1></body></html>"
        
        webView.loadHTMLString(html, baseURL: nil)
        
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

