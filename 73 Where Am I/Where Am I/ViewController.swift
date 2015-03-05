//
//  ViewController.swift
//  Where Am I
//
//  Created by Simon Cronly-Dillon on 05/01/2015.
//  Copyright (c) 2015 dataclones. All rights reserved.
//
// This App shows the details of your GPS coordinates and reverse
// Processes this to grab the nearest address too

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var latitude: UILabel!
    
    @IBOutlet weak var longitude: UILabel!
    
    @IBOutlet weak var altitude: UILabel!
    
    @IBOutlet weak var course: UILabel!
    
    @IBOutlet weak var speed: UILabel!
    
    @IBOutlet weak var address: UILabel!
    
    @IBOutlet weak var myMap: MKMapView!
    
    var manager:CLLocationManager!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    manager = CLLocationManager()
    manager.delegate = self
    manager.desiredAccuracy = kCLLocationAccuracyBest
    manager.requestWhenInUseAuthorization()
    manager.startUpdatingLocation()
        
    
    }

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations:[AnyObject]) {
        
        var userLocation:CLLocation = locations[0] as CLLocation
        
        // GPS map
        
        var GPSlatitude : CLLocationDegrees = userLocation.coordinate.latitude
        var GPSlongitude : CLLocationDegrees = userLocation.coordinate.longitude
        
        var latDelta : CLLocationDegrees = 0.008 // Zoom degrees from one side of screen to other
        
        var lonDelta : CLLocationDegrees = 0.008 // Zoom degrees from top to bottom
        
        var span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta
            , lonDelta) // Map range
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(GPSlatitude, GPSlongitude) // The location in desired format
        
        var region: MKCoordinateRegion = MKCoordinateRegionMake(location, span) // Create the region from our center long v lat going out to our span range
        
        myMap.setRegion(region, animated: true) // Produce map in view

        
        
        // Show stats
        
        latitude.text = "\(userLocation.coordinate.latitude)"
        
        longitude.text = "\(userLocation.coordinate.longitude)"
        
        altitude.text = NSString(format: "%5.f m", userLocation.altitude)
         
        course.text = NSString(format: "%2.f°", userLocation.course)
        
        speed.text = NSString(format: "%3.f km/h", (userLocation.speed * 3.6))
        
        // Address
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: {(placemarks, error) in
            
            if ((error) != nil) { println("Error: \(error)") }
            else {
                let p = CLPlacemark(placemark: placemarks?[0] as CLPlacemark)

                
                var subThoroughfare:String
                
                if ((p.subThoroughfare) != nil) {
                    subThoroughfare = p.subThoroughfare
                } else {
                    subThoroughfare = ""
                }
                
                var thoroughfare:String
                
                if ((p.thoroughfare) != nil) {
                    thoroughfare = p.thoroughfare
                } else {
                    thoroughfare = ""
                }
                
                var subLocality:String
                
                if ((p.subLocality) != nil) {
                    subLocality = p.subLocality
                } else {
                    subLocality = ""
                }
                

                self.address.text = "\(subThoroughfare) \(thoroughfare) \n \(subLocality) \n \(p.locality) \n \(p.subAdministrativeArea) \(p.postalCode) \n \(p.country)"
                
                
                
            }
            
            })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

