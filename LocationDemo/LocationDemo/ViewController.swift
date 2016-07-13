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

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    let locationManager = CLLocationManager()

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager.delegate = self
        
        mapView.delegate = self
        
        let coordinate = CLLocationCoordinate2D(latitude: 28.633811, longitude: 77.4439844)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "ABES Engg. College"
        annotation.subtitle = "A random subtitle"
        mapView.addAnnotation(annotation)
        
        
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
            
            
            locationManager.startUpdatingLocation()
            
            
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
    
    func mapViewDidFinishRenderingMap(mapView: MKMapView, fullyRendered: Bool) {
        let coordinate = CLLocationCoordinate2D(latitude: 28.633811, longitude: 77.4439844)
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(coordinate, 5000.0, 5000.0), animated: true)
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        var reusableView = mapView.dequeueReusableAnnotationViewWithIdentifier("hello")
        
        if reusableView == nil {
            reusableView = MKAnnotationView(annotation: annotation, reuseIdentifier: "hello")
        }
        
        reusableView!.image = UIImage(named: "Car")
        reusableView!.enabled = true
        reusableView!.canShowCallout = true
        
        return reusableView
    }
    
    //

}

