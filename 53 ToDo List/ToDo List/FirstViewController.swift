//
//  FirstViewController.swift
//  ToDo List
//
//  Created by Simon Cronly-Dillon on 16/12/2014.
//  Copyright (c) 2014 dataclones. All rights reserved.
//

import UIKit

var toDoItems:[String]=[]
        // Define and initialize empty list array

class FirstViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet weak var tasksTable: UITableView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        
        return toDoItems.count
        
        // Count items in list array
        
    }
    
    
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoItems[indexPath.row]
        
        return cell
        
        // Display next cell onto list view
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        // type viewWillAppear to insert this function
        // this is run every time before the view loads - note difference to 1 time run viewDidLoad
        
        if var storedtoDoItems : AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("toDoItems") {
            // if 'storedtoDoItems' is TRUE - if NSUserDefaults is empty, then this won't happen
            // but if there are items in the NSUserDefaukts
            
            toDoItems = []
            // first empty the array
            
            for var i = 0; i < storedtoDoItems.count; ++i {
                // can't set toDoItems array to 'fixedtoDoItems' which is an 'object'
                // so loop through stored items and add each to an array
                
                toDoItems.append(storedtoDoItems[i] as! NSString as String)
                // Convert the object to a string and append it to our array
                
            }
            
        }
        
        tasksTable.reloadData ()
        // refreshes our table view called 'tasksTable'
    }
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        
        // cmd-click on UITableViewDelegate, cmd-F type 'commit'
        // This allows editing on the Table
        
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            // Is the user is trying to Delete something
            
            toDoItems.removeAtIndex(indexPath.row)
            
            let fixedToDoitems = toDoItems
            NSUserDefaults.standardUserDefaults().setObject(fixedToDoitems, forKey: "toDoItems")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            tasksTable.reloadData()
            // refresh table to show item gone
        }
        
    }
    
}

