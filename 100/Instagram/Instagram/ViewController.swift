//
//  ViewController.swift
//  Instagram
//
//  Created by Simon Cronly-Dillon on 22/01/2015.
//  Copyright (c) 2015 dataclones. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // Global variable
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

    
    @IBOutlet weak var pickedImage: UIImageView!
    
    @IBAction func pickImage(sender: AnyObject) {
        
        var libraryImage = UIImagePickerController()
        libraryImage.delegate = self
        
        // Select from Photo Library
        libraryImage.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        // Take image with camera
        //libraryImage.sourceType = UIImagePickerControllerSourceType.Camera
        
        libraryImage.allowsEditing = false
        
        //Show image with Image Editing View controller
        self.presentViewController(libraryImage, animated: true, completion: nil)
        
    }
    
    // Select image from Library
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage newImage: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
        println("Image Selected")
        // Close after image selected
        self.dismissViewControllerAnimated(true, completion: nil)
        
        pickedImage.image = newImage
    }
    
    @IBAction func pause(sender: AnyObject) {
        
        // Activity indicator view
        //var activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0,0,50,50))
        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0,0,50,50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        // Disable App
        //UIApplication.sharedApplication().beginIgnoringInteractionEvents()
    }
    
    @IBAction func restore(sender: AnyObject) {
        
        // Stop the inactivity indicator and hide as hideWhenStopped is true
        activityIndicator.stopAnimating()
        
        // Enable app interactions again
        //UIApplication.sharedApplication().endIgnoringInteractionEvents()
    }
    
    @IBAction func createAlert(sender: AnyObject) {
        
        // Alert
        var alert = UIAlertController(title: "Smell Detected", message: "Did you fart?", preferredStyle: UIAlertControllerStyle.Alert)
        // Alert button - returns var action
        alert.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { action in
            
            // Dismiss view controller
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        //Show Alert view
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Authorize Parse setup with client and application id's
        Parse.setApplicationId("9ckpb5CSXsoR0FQiEBt7VfKAyXVTmRUtPD55BMe7", clientKey: "zrj16gvx930bZ74UGAaA1b433qa0qHv98SxHlRlb")
        
        // Save to Parse backend: users name and score ***
/*
        // Create a Parse class object
        var score = PFObject(className: "score")
        
        // Add a variable called 'name' with value 'Simon'
        score.setObject("Simon", forKey: "name")
        
        score.setObject(93, forKey: "points")
        
        score.saveInBackgroundWithBlock { (success: Bool, error: NSError!) -> Void in
            
            if success == true {
                
                println("Score created with ID: \(score.objectId)")
            } else {
                
                println(error)
            }
            
            }
*/
        // Retrieve from Parse ***
/*
        var query = PFQuery(className: "score")
        
        query.getObjectInBackgroundWithId("qVaGqQj5Eg"){
            (score: PFObject!, error: NSError!) -> Void in
            
            if error == nil {
                
                // All the score data
                //println(score)
                
                // The score points
                println(score.objectForKey("points") as NSString) // Is an Object so need to clarify as NSString of want to do anything with it
                
            } else {
                
                println(error)
            }
            
        }
*/
        // Update object in Parse ***
/*
        var query = PFQuery(className: "score")

        query.getObjectInBackgroundWithId("qVaGqQj5Eg"){
            (score: PFObject!, error: NSError!) -> Void in

            if error == nil {

                score["name"] = "Micaela"
                score["points"] = 123       // Use wrong identifier and it gets omitted
                
                score.saveInBackground()

            } else {

                println(error)
            }

        }
*/
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

