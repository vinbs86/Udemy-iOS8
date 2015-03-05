//
//  SecondViewController.swift
//  ToDo List
//
//  Created by Simon Cronly-Dillon on 16/12/2014.
//  Copyright (c) 2014 dataclones. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController, UITextFieldDelegate {
    
    // UITextFieldDelegate for the Return key keyboard close
    
    
    @IBOutlet weak var displayMessage: UILabel!
    
    @IBOutlet weak var toDoItem: UITextField!
    
    
    @IBAction func addItem(sender: AnyObject) {
        //ENTER button
        
        
        if (toDoItem != " " && toDoItem != "" && toDoItem != nil) {
            
            toDoItems.append(toDoItem.text)
            
            let fixedtoDoItems = toDoItems
            // let sets INMUTABLE array 'fixedtoDoItems from mutable toDoitems array
            // NSUserDefaults needs an inmutable array
            
            NSUserDefaults.standardUserDefaults().setObject(fixedtoDoItems, forKey: "toDoItems")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            println(fixedtoDoItems)
            
            displayMessage.text = toDoItem.text
            
            // add new toDoItem to toDoItems array
            
            
        } else {
            displayMessage.text = "Please enter an item name:"
        }
       self.view.endEditing(true)
        // Close keyboard when the button is pressed
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         displayMessage.text = "Please enter a new item:"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
        
        // Close keyboard by tapping elsewhere - type touchesBegan to autofill
        // Needs UITextfieldDelegate class declaration
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
        // Close keyboard by tapping return - needs UITextfieldDelegate class declaration
        // CTRL-click from the textFireld to the Yellow Sqaure and choose delegete
        
    }


}

