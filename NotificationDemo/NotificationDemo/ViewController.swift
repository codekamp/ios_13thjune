//
//  ViewController.swift
//  NotificationDemo
//
//  Created by Cerebro on 23/06/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.reloadUI(_:)), name: "new_song_favorited", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reloadUI(notification:NSNotification) {
        print(notification.name)
        
        let userInfo = notification.userInfo!
        
        print(userInfo["song_id"]!)
        print("user logged in, so we need to reload the UI")
        
        
    }
    
    
    @IBAction func loginButtonTapped() {
        AuthService().login("abcd", password: "secret")
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "user_logged_in", object: nil)
    }

}

