//
//  ViewController.swift
//  Learning Maps
//
//  Created by Rob Percival on 11/07/2014.
//  Copyright (c) 2014 Appfish. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation



class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet var myMap: MKMapView!
    
    
    @IBAction func findMe(sender: AnyObject) {
        
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        
    }
    
    @IBOutlet var latitude : UILabel!
    @IBOutlet var longitude : UILabel!
    @IBOutlet var address : UILabel!
    @IBOutlet var altitude : UILabel!
    @IBOutlet var speed : UILabel!
    @IBOutlet var heading : UILabel!
    
    var manager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        if activePlace == -1 {
            
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
            
        } else {
        
        
        let lat = NSString(string: places[activePlace]["lat"]!).doubleValue
        
        let lon = NSString(string: places[activePlace]["lon"]!).doubleValue
        
        var latitude:CLLocationDegrees = lat
        
        var longitude:CLLocationDegrees = lon
        
        var latDelta:CLLocationDegrees = 0.01
        
        var lonDelta:CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        myMap.setRegion(region, animated: true)
            
        var annotation = MKPointAnnotation()
            
        annotation.coordinate = location
            
        annotation.title = places[activePlace]["name"]
            
        myMap.addAnnotation(annotation)
            
            
            
        }
        
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        
        uilpgr.minimumPressDuration = 2.0
        
        myMap.addGestureRecognizer(uilpgr)
        
        
    }
    
    func action(gestureRecognizer:UIGestureRecognizer) {
        
        
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            
            
        
        var touchPoint = gestureRecognizer.locationInView(self.myMap)
        
        var newCoordinate = myMap.convertPoint(touchPoint, toCoordinateFromView: self.myMap)
        
        
        
        var loc = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
        
        
        CLGeocoder().reverseGeocodeLocation(loc, completionHandler:{(placemarks, error) in
            
            if ((error) != nil)  { println("Error: \(error)") }
            else {
                
                
                
                let p = CLPlacemark(placemark: placemarks?[0] as CLPlacemark)
                
                var subThoroughfare:String
                var thoroughfare:String
                
                if ((p.subThoroughfare) != nil) {
                    subThoroughfare = p.subThoroughfare
                } else {
                    subThoroughfare = ""
                }
                
                if ((p.thoroughfare) != nil) {
                    thoroughfare = p.thoroughfare
                } else {
                    thoroughfare = ""
                }
                
                
                var annotation = MKPointAnnotation()
                
                annotation.coordinate = newCoordinate
                
                var title = "\(subThoroughfare) \(thoroughfare)"
                
                if title == " " {
                    
                    var date = NSDate()
                    
                    title = "Added \(date)"
                    
                }
                
                annotation.title = title
                
                self.myMap.addAnnotation(annotation)
                
                places.append(["name":title,"lat":"\(newCoordinate.latitude)","lon":"\(newCoordinate.longitude)"])
                
                
            }
            
            
            })
            
            
        }

        
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        self.navigationController?.navigationBarHidden = false
        
    }
    
    
    func locationManager(manager:CLLocationManager, didUpdateLocations locations:[AnyObject]) {
        
        var userLocation:CLLocation = locations[0] as CLLocation
        
        var latitude:CLLocationDegrees = userLocation.coordinate.latitude
        
        var longitude:CLLocationDegrees = userLocation.coordinate.longitude
        
        var latDelta:CLLocationDegrees = 0.01
        
        var lonDelta:CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        myMap.setRegion(region, animated: true)
        
        manager.stopUpdatingLocation()
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler:{(placemarks, error) in
            
            if ((error) != nil)  { println("Error: \(error)") }
            else {
                
                let p = CLPlacemark(placemark: placemarks?[0] as CLPlacemark)
                
                var subThoroughfare:String
                
                if ((p.subThoroughfare) != nil) {
                    subThoroughfare = p.subThoroughfare
                } else {
                    subThoroughfare = ""
                }
                
                self.address.text =  "\(subThoroughfare) \(p.thoroughfare) \n \(p.subLocality) \n \(p.subAdministrativeArea) \n \(p.postalCode) \(p.country)"
                
                
                
                
            }
            
            
            })
        
    }
    
   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

