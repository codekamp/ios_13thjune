//
//  AuthenticationService.swift
//  NotificationDemo
//
//  Created by Cerebro on 23/06/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import Foundation

class AuthService {
    func login(email:String, password:String) -> Bool {
        
        if password == "secret" {
            
            let info = ["song_id":"123"];
            NSNotificationCenter.defaultCenter().postNotificationName("new_song_favorited", object: nil, userInfo: info)
            return true
        }
        
        
        return false
    }
}