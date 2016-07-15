//
//  File.swift
//  NSOperationsQueueDemo
//
//  Created by Cerebro on 14/07/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import Foundation
import UIKit

class ImageDownloadOperation: NSOperation {
    
    var url:String
    var downloadedImage:UIImage?
    
    init(url:String) {
        self.url = url
    }
    
    override func main() {
        
        for i in 0...10 {
            sleep(1)
            print("\(url) downloaded \(i*10) %")
        }
        
        self.downloadedImage = UIImage()
    }
}