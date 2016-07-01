//
//  Constants.swift
//  WallpapaerDemoApp
//
//  Created by Cerebro on 23/12/15.
//  Copyright © 2015 CodeKamp. All rights reserved.
//

import Foundation

struct Constants {

    struct Flickr {
        static let apiKey = "3e3505d474ada3ea358a7ac93df44d77"
        static let apiUrl = "https://api.flickr.com/services/rest/"
        static let searchMethod = "flickr.photos.search"
        static let formatType = "json"
        static let jsonCallback = 1
        static let privacyFilter = 1
    }

    struct CellReuseIdentifiers {
        static let menuCell = "menu_tableview_cell"
        static let photoCell = "photo_collectionview_cell"
    }

    struct StoryboardIds {
        static let photosViewController = "photos_view_controller"
        static let photoDetailViewController = "photo_detail_view_controller"
    }

    struct Images {
        static let placeholderPhoto = "PlaceholderPhoto"
    }
}
