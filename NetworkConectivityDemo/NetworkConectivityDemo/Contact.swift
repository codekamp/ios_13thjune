//
//  Contact.swift
//  NetworkConectivityDemo
//
//  Created by Cerebro on 28/06/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import Foundation
import SwiftyJSON

class Contact {
    
    let id:String
    let name:String
    let email:String
    
    init(json:JSON) {
        self.id = json["id"].string!
        self.name = json["merges"]["FNAME"].string! + " " + json["merges"]["LNAME"].string!
        self.email = json["email"].string!
    }
}