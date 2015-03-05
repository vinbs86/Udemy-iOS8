//
//  ViewController.swift
//  Managing The Keyboard
//
//  Created by Simon Cronly-Dillon on 16/12/2014.
//  Copyright (c) 2014 dataclones. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var myText: UITextField!
    
    
    @IBAction func myButton(sender: UIButton) {
        
        if ( myText != nil) {
            
            message.text = myText.text
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        message.text = "..."
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
        
        // Close keyboard by tapping elsewhere
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
        // Close keyboard by tapping return
        
    }
    
    
}

