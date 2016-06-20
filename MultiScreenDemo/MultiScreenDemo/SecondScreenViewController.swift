//
//  SecondScreenViewController.swift
//  MultiScreenDemo
//
//  Created by Cerebro on 20/06/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import UIKit

class SecondScreenViewController: UIViewController {
    
    var randomIncomingData:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Second screen loaded")
        print("incoming data is \(randomIncomingData)")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Second screen is about to appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        print("Second Screen appeared")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("Second screen will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("Second screen disappeared")
    }
    @IBAction func goBack() {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
