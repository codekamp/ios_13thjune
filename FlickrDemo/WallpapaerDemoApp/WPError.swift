//
//  WPError.swift
//  WallpapaerDemoApp
//
//  Created by Cerebro on 23/12/15.
//  Copyright © 2015 CodeKamp. All rights reserved.
//

import Foundation
import SwiftyJSON

class WPError {
    var code:Int
    var message:String

    init(code:Int, message:String) {
        self.code = code
        self.message = message
    }
}
