//
//  Dictionary+WP.swift
//  WallpapaerDemoApp
//
//  Created by Cerebro on 23/12/15.
//  Copyright © 2015 CodeKamp. All rights reserved.
//

import Foundation

extension Dictionary {

    mutating func union(dictionary: Dictionary) {
        dictionary.forEach { self.updateValue($1, forKey: $0) }
    }
}
