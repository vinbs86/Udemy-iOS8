//
//  ViewController.swift
//  Instagrammer
//
//  Created by Simon Cronly-Dillon on 23/01/2015.
//  Copyright (c) 2015 dataclones. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    func displayAlert(title: String, errorAlert: String){
        
        // Alert
        var alert = UIAlertController(title: title, message: errorAlert, preferredStyle: UIAlertControllerStyle.Alert)
        // Alert button - returns var action
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            // Dismiss view controller
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        //Show Alert view
        self.presentViewController(alert, animated: true, completion: nil)

        
    }
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func signIn(sender: AnyObject) {
        
        // Check user exists and give Alert if not
        
        var errorMessage = ""
        
        if username.text == "" || password.text == "" {
            
            errorMessage = "Please enter your username and password"
        }
        
        if errorMessage != "" {
            
            displayAlert("Sign-in error", errorAlert: errorMessage)
            
        } else {
            
            // Parse Signing Up code
            var user = PFUser()
            user.username = username.text
            user.password = password.text
       
            user.signUpInBackgroundWithBlock {
                (succeeded: Bool!, error: NSError!) -> Void in
                if error == nil {
                    // Hooray! Let them use the app now.
                } else {
                    if let errorString = error.userInfo?["error"] as? NSString {
                        
                        let error = errorString
                        
                    } else {
                        
                        errorMessage = "Please try again later."
                    }
                    
                    self.displayAlert("Could Not Sign Up", errorAlert: errorMessage)
                }
            }
            
        }
        
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

