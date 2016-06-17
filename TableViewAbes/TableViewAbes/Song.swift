//
//  File.swift
//  TableViewAbes
//
//  Created by Cerebro on 17/06/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import Foundation

class Song {
    var title:String
    var album:String
    
    init(title:String, album:String) {
        self.title = title
        self.album = album
    }
    
    class func allSongs() -> [Song] {
        var songs = [Song]()
        
        for index in 1...100 {
            songs.append(Song(title: "Song \(index)", album: "Album \(index)"))
        }
        
        return songs
    }
}