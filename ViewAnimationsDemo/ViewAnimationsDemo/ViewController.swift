//
//  ViewController.swift
//  ViewAnimationsDemo
//
//  Created by Cerebro on 06/07/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        
        self.view.addGestureRecognizer(gesture)
        
        
        
        
    }
    
    @IBAction func panGesture(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(nil)
        print(translation.x)
        print(translation.y)
        
        sender.setTranslation(CGPointZero, inView: nil)
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let alert = UIAlertView(title: "hello", message: "this is to inform you that...", delegate: self, cancelButtonTitle: "canelll", otherButtonTitles: "doneee")
        
        alert.show()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapped(sender: AnyObject) {
        print("tapped")
    }
    
}

