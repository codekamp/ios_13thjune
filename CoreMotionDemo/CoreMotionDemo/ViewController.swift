//
//  ViewController.swift
//  CoreMotionDemo
//
//  Created by Cerebro on 13/07/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import UIKit
import CoreMotion
import Contacts

class ViewController: UIViewController {
    
    let manager = CMMotionManager()
    
    @IBAction func printOrientation() {
        
        if UIDevice.currentDevice().orientation == .Portrait {
            print("device is in portrait mode")
        } else if UIDevice.currentDevice().orientation == .LandscapeLeft || UIDevice.currentDevice().orientation == .LandscapeRight {
            print("device is in landscape mode")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(printOrientation), name: UIDeviceOrientationDidChangeNotification, object: nil)
        
        //        if manager.accelerometerAvailable {
        //            manager.accelerometerUpdateInterval = 5.0
        //            manager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (accData, error) in
        //                print(error)
        //                print(accData?.acceleration.x)
        //                print(accData?.acceleration.y)
        //                print(accData?.acceleration.z)
        //            })
        //        }
        
        //        if manager.gyroAvailable {
        //            manager.gyroUpdateInterval = 0.25
        //            manager.startGyroUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (gyroData, error) in
        //                print(error)
        //                print(gyroData?.rotationRate.x)
        //                print(gyroData?.rotationRate.y)
        //                print(gyroData?.rotationRate.z)
        //            })
        //        }
        
//        if manager.magnetometerAvailable {
//            manager.magnetometerUpdateInterval = 1.0
//            manager.startMagnetometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (mangatoData, error) in
//                print(error)
//                print(mangatoData?.magneticField.x)
//                print(mangatoData?.magneticField.y)
//                print(mangatoData?.magneticField.z)
//            })
//        }
        
        if manager.deviceMotionAvailable {
            manager.deviceMotionUpdateInterval = 1.0
            manager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (deviceMotionData, error) in
                print(error)
                
                // rotation (in radians) along x axis
                print(deviceMotionData?.attitude.pitch)
                
                //rotation along y axis
                print(deviceMotionData?.attitude.roll)
                
                //rotation along y axis
                print(deviceMotionData?.attitude.yaw)
                
                print(deviceMotionData?.userAcceleration)
            })
        }
        
        let store = CNContactStore()
        
        store.requestAccessForEntityType(.Contacts) { (allowed, error) in
            let fetchRequest = CNContactFetchRequest()
            if allowed {
            try! store.enumerateContactsWithFetchRequest(fetchRequest, usingBlock: { (contact, contactPoninter) in
                
            })
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            print("shake detected")
        }
    }
    
    
}

