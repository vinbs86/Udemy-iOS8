//
//  ViewController.swift
//  Core Data Deleting 86
//
//  Created by Simon Cronly-Dillon on 15/01/2015.
//  Copyright (c) 2015 dataclones. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //DATA STRUCTURE
        var appDel:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        
        
        //NEW ITEM IN "Users" ENTITY - comment out if dont want added again to permanent storage
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as NSManagedObject
        
        newUser.setValue("Mica", forKey: "username")
        
        newUser.setValue("6789", forKey: "password")
        
        //SAVE TO DATABASE
        context.save(nil)
        
        
        
        
        //FETCH ITEM FROM DATABASE from Users table
        var request = NSFetchRequest(entityName: "Users")
        
        //Store data in array called results
        var results = context.executeFetchRequest(request, error: nil)
        
        
        // Check if there is data
        if results?.count > 0 {
            
            //Whilst there are items in our results array loop though
            for result: AnyObject in results! {
                
                if let user = result.valueForKey("username") as? String {
                    
                    if user == "Mica" {
                        
                        // DELETE SPECIFIC OBJECT FROM DATABASE ***
                        context.deleteObject(result as NSManagedObject)
                        
                        println(user + " has been deleted")
                    }
                    
                }
                
                // COMMIT DELETE TO DATABASE ***
                context.save(nil)
                
            }
        } else {
            //No data in fetch request
            println("No results")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

