//
//  FlickrService.swift
//  WallpapaerDemoApp
//
//  Created by Cerebro on 23/12/15.
//  Copyright © 2015 CodeKamp. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ReachabilitySwift

class WPFlickrService {

    class func searchImagesWithTag(tag:String ,success:([WPPhoto]) -> Void, failure:(WPError -> Void)?) {

        let params = ["method": Constants.Flickr.searchMethod, "tags":tag]

        request(.GET, params: params, success: { (json) -> Void in

            print(json)
            var photos:[WPPhoto] = []

            for (_,subJson):(String, JSON) in json["photos"]["photo"] {
                photos.append(WPPhoto(json: subJson))
            }

            success(photos)

            }, failure:  { (error) -> Void in
                failure?(error)
        })
    }


    class func request(method: Alamofire.Method, params:[String: AnyObject]?, success:(JSON -> Void)?, failure:(WPError -> Void)?) {

        do {
            let reachability = try Reachability.reachabilityForInternetConnection()

            if !reachability.isReachable() {
                failure?(WPError(code:0, message:"Internet not available"))
                return
            }
        } catch {
            print("Unable to access reachability")
        }

        var allParams:[String:AnyObject] = ["api_key": Constants.Flickr.apiKey, "privacy_filter":Constants.Flickr.privacyFilter, "format":Constants.Flickr.formatType, "nojsoncallback": Constants.Flickr.jsonCallback]

        if params != nil {
            allParams.union(params!)
        }

        Alamofire.request(method, Constants.Flickr.apiUrl, parameters: allParams).validate()
            .responseJSON {
                response in
                switch response.result {
                case .Success:
                    if let value = response.result.value  {
                        let json = JSON(value)
                        success?(json)
                    }
                case .Failure:
                    failure?(WPError(code:0, message:"some error occured"))

                }
        }
    }
}
