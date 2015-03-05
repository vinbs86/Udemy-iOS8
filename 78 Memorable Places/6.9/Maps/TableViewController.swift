//
//  TableViewController.swift
//  Maps
//
//  Created by Rob Percival on 11/08/2014.
//  Copyright (c) 2014 Appfish. All rights reserved.
//

//
//  TableViewController.swift
//  Maps
//
//  Created by Rob Percival on 11/08/2014.
//  Copyright (c) 2014 Appfish. All rights reserved.
//

import UIKit

var activePlace = 0

var places = [Dictionary<String,String>()]

class TableViewController: UITableViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        if places.count == 1 {
            
            places.removeAtIndex(0)
            
        }
        
        if places.count == 0 {
      
            places.append(["name":"Taj Mahal","lat":"27.175277","lon":"78.042128"])
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        self.navigationController?.navigationBarHidden = true
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)  {
        
        if segue.identifier == "addPlace" {
            activePlace = -1
        }
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        activePlace = indexPath.row
        
        
        self.performSegueWithIdentifier("findPlace", sender: indexPath)
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = places[indexPath.row]["name"]
        
        return cell
    }
    
    
    
}



