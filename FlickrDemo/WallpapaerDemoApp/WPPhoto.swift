//
//  WPImage.swift
//  WallpapaerDemoApp
//
//  Created by Cerebro on 23/12/15.
//  Copyright © 2015 CodeKamp. All rights reserved.
//

import Foundation
import SwiftyJSON

class WPPhoto {


    var title:String
    var url:String

    init(json: JSON) {

        self.title = json["title"].string!
        self.url = "https://farm\(json["farm"].int!).staticflickr.com/\(json["server"].string!)/\(json["id"].string!)_\(json["secret"].string!)_n.jpg"
    }
}
