//
//  ViewController.swift
//  Times Tables 45
//
//  Created by Simon Cronly-Dillon on 19/01/2015.
//  Copyright (c) 2015 dataclones. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var sliderValue: UISlider!
    
    @IBAction func sliderMoved(sender: AnyObject) {
        
        // update table values with new slider reading
        table.reloadData()
        
    }
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Fixed
        return 21
        
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Define cell data
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        let timesTable = Int(sliderValue.value)
        
        var row = indexPath.row
        
        if row >= 1 {
            
            var product = row*timesTable

            // Slider value times row number (+1 to remove zero)
            cell.textLabel?.text = String(format: "%i times %i = %i", row, timesTable, product)
            
        }
        
        
        
        return cell
        
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

