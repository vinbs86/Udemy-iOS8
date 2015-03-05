//
//  ViewController.swift
//  Memorable Places
//
//  Created by Simon Cronly-Dillon on 08/01/2015.
//  Copyright (c) 2015 dataclones. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var myMap: MKMapView!
    
    var manager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Core Location
        
        manager.delegate = self
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        manager.requestWhenInUseAuthorization() // Only runs first time
        
        manager.startUpdatingLocation()
        
        
        
        
        
        
        // Draw a map point
        
        
        var latittude : CLLocationDegrees = 40.456271
        var longitude : CLLocationDegrees = -3.808406
        
        
        var latDelta : CLLocationDegrees = 0.008 // Zoom degrees from one side of screen to other
        
        var lonDelta : CLLocationDegrees = 0.008 // Zoom degrees from top to bottom
        
        var span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta
            , lonDelta) // Map range
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latittude, longitude) // The location in desired format
        
        var region: MKCoordinateRegion = MKCoordinateRegionMake(location, span) // Create the region from our center long v lat going out to our span range
        
        myMap.setRegion(region, animated: true) // Produce map in view
        
        
        
        // create annotation
        
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        annotation.title = "Casa"
        
        annotation.subtitle = "C/Gomez Tejedor 61A"
        
        myMap.addAnnotation(annotation) // Produce annotation - upon click
        
        
        // long press
        
        
        var longPress = UILongPressGestureRecognizer(target: self, action: "action:")
        // longPress calls function action with : signifying parameters
        
        longPress.minimumPressDuration = 2.0
        // longPress is at least 2 secs
        
        myMap.addGestureRecognizer(longPress)
        
    }
    
    
    // The object that longPress sends to:
    
    func action(gestureRecognizer:UIGestureRecognizer) {
        
        // Work out where user did longPress
        var touchPoint = gestureRecognizer.locationInView(self.myMap) // self as within brackets
        
        // Work out coordinates of that spot on the map
        var newCoordinate:CLLocationCoordinate2D = myMap.convertPoint(touchPoint, toCoordinateFromView: self.myMap)
        
        // Add annotation on the map
        var newAnnotation = MKPointAnnotation() // create new annotation
        
        newAnnotation.coordinate = newCoordinate
        
        newAnnotation.title = "New point"
        
        newAnnotation.subtitle = "Some details here"
        
        myMap.addAnnotation(newAnnotation) // Produce new annotation - upon click
        
        
    }
    
    
    
    // Location Manager function - draw position live on map
    
    func locationManager(manager:CLLocationManager, didUpdateLocations locations:[AnyObject]) {
        // Performs a locationManager function using variable 'manager' - called didUpdateLocations
        // Which runs each time location is updated
        
        //println("locations = \(locations)")
        
        var userLocation:CLLocation = locations [0] as CLLocation
        
        var latittude : CLLocationDegrees = userLocation.coordinate.latitude
        var longitude : CLLocationDegrees = userLocation.coordinate.longitude
        
        var latDelta : CLLocationDegrees = 0.008 // Zoom degrees from one side of screen to other
        
        var lonDelta : CLLocationDegrees = 0.008 // Zoom degrees from top to bottom
        
        var span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta
            , lonDelta) // Map range
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latittude, longitude) // The location in desired format
        
        var region: MKCoordinateRegion = MKCoordinateRegionMake(location, span) // Create the region from our center long v lat going out to our span range
        
        myMap.setRegion(region, animated: true) // Produce map in view
        
        
    }
    
    
    // Location Manager Error Capture - maybe not authorized by user of GPS is turned off
    
    func locationManager(manager:CLLocationManager, didFailWithError error:NSError) {
        
        println(error)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

