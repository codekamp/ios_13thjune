//
//  List.swift
//  NetworkConectivityDemo
//
//  Created by Cerebro on 28/06/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import Foundation
import SwiftyJSON

class List {
    let id:String
    let name:String
    
    init(json:JSON) {
        self.id = json["id"].string!
        self.name = json["name"].string!
    }
}