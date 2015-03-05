//
//  ViewController.swift
//  Table Views2
//
//  Created by Simon Cronly-Dillon on 16/12/2014.
//  Copyright (c) 2014 dataclones. All rights reserved.
//


import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    var items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
        
    }
    
    
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
        
    }
    
}


