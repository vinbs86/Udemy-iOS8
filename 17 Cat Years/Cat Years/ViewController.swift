//
//  ViewController.swift
//  Cat Years
//
//  Created by Simon Cronly-Dillon on 09/12/2014.
//  Copyright (c) 2014 dataclones. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var catAge: UITextField!
    
    @IBOutlet weak var message: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        println(catAge.text)
        
        //convert from string variable to integer
        var age = catAge.text.toInt()
        
        if ((age) != nil) {
            
            age = age! * 7  //! ignore fails, e.g. if variable is empty
            
            message.text = "Your cat is \(age!) years old" //! force unwrap
            
        } else {
            
            message.text = "Please enter a number in the box"
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

