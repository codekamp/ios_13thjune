//
//  CodeKampError.swift
//  NetworkConectivityDemo
//
//  Created by Cerebro on 29/06/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import Foundation

class CodeKampError {
    
    let statusCode:Int
    let code:Int
    let message:String
    
    init(statusCode:Int, code:Int, message:String) {
        self.statusCode = statusCode
        self.code = code
        self.message = message
    }
}