//
//  ViewController.swift
//  View Controllers
//
//  Created by Simon Cronly-Dillon on 13/12/2014.
//  Copyright (c) 2014 dataclones. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    var array = ["Simon", "Micaela", "Elisa", "Kate", "Will"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        
        println("\(array.count)")
        return array.count
    }

    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = array[indexPath.row]
        println("Row: \(indexPath.row) Text: \(cell.textLabel?.text)")
        return cell
        
    }
    
    
}

