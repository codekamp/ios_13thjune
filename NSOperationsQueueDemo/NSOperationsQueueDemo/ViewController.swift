//
//  ViewController.swift
//  NSOperationsQueueDemo
//
//  Created by Cerebro on 14/07/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let queue1 = NSOperationQueue()
    let queue2 = NSOperationQueue()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let operation1 = ImageDownloadOperation(url:"http://google.com/logo.png")
        
        operation1.completionBlock = {
            
            operation1.downloadedImage
            
        }
        queue1.addOperation(operation1)
        queue1.addOperation(ImageDownloadOperation(url:"http://facebook.com/logo.png"))
        
        queue1.cancelAllOperations()
        queue1.suspended = true
        operation1.cancel()
        
        
        print("main queue is free now")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

