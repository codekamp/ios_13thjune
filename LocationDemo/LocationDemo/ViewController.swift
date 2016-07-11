//
//  ViewController.swift
//  LocationDemo
//
//  Created by Cerebro on 11/07/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let status = CLLocationManager.authorizationStatus()
        
        
        if status == CLAuthorizationStatus.NotDetermined {
            print("asking for location")
            locationManager.requestWhenInUseAuthorization()
            
        } else if status == CLAuthorizationStatus.Denied || status == CLAuthorizationStatus.Restricted {
            print("we asked for permission sometime back and user denied")
            
            
            let alertController = UIAlertController(
                title: "Location Access Disabled",
                message: "In order to use your current location to book cab, please open this settings app and allow us location access",
                preferredStyle: .Alert)
            
            
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            let openAction = UIAlertAction(title: "Open Settings", style: .Default) { (action) in
                if let url = NSURL(string:UIApplicationOpenSettingsURLString) {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            alertController.addAction(openAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        } else if status == CLAuthorizationStatus.AuthorizedAlways || status == CLAuthorizationStatus.AuthorizedWhenInUse {
            print("we are listening for updates")
            
            locationManager.desiredAccuracy = 200.0
            
            let coordinate = CLLocationCoordinate2D(latitude: 51.50998, longitude: -0.1337)
            
            let region = CLCircularRegion(center: coordinate, radius: 5000.0, identifier: "Lodon")
            
            locationManager.startMonitoringForRegion(region)
            locationManager.startUpdatingLocation()
            
//            let coordinate1 = CLLocationCoordinate2D(latitude: 51.50998, longitude: -0.1337)
//            
//            let region1 = CLCircularRegion(center: coordinate1, radius: 10.0, identifier: "Lodon")
//            
//            locationManager.startMonitoringForRegion(region1)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        print(location!.coordinate.latitude)
        print(location!.coordinate.longitude)
    }
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("we have entered " + region.identifier)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error.localizedFailureReason)
    }

}

