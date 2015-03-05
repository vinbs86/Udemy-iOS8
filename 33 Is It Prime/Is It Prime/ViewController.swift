//
//  ViewController.swift
//  Is It Prime
//
//  Created by Simon Cronly-Dillon on 11/12/2014.
//  Copyright (c) 2014 dataclones. All rights reserved.
//
// Whole number or  Integer greater than 1 or more

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var number: UITextField!
    
    @IBOutlet weak var message: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        var isPrime = true
        
        var Integer = number.text.toInt()
        
        if (Integer != nil){
            
            if (Integer < 1) {
                message.text = "Please enter a postive number"
            } else {
                if (Integer == 1) {
                    message.text = "1 is not prime."
                } else {
                    
                    var divisors = [Int]()
                    //Modulo is remainder 0?
                    for var i = 2; i < Integer; ++i {
                        if (Integer! % i == 0) {
                            isPrime = false
                            divisors.append(i)
                        }
                    }
                    if (isPrime == true) {
                        message.text = "That is a Prime Number"
                    } else {
                        message.text = "That number is NOT prime because it is divisble by \(divisors)"
                    }
                }
            }
            
        } else {
            
            message.text = "Please enter a number"
        }
        
        println(number.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

