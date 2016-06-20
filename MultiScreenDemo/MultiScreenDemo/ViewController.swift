//
//  ViewController.swift
//  MultiScreenDemo
//
//  Created by Cerebro on 20/06/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var randomTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("First screen loaded")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print("First screen is about to appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        
        print("First Screen appeared")
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("First screen will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("First screen disappeared")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "first_to_second_segue" {
            let randomData = randomTextField.text
            
            let destinationVC = segue.destinationViewController as! SecondScreenViewController
            
            destinationVC.randomIncomingData = randomData
            
        }
    }


}

