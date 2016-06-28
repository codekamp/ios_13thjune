//
//  MailChimpService.swift
//  NetworkConectivityDemo
//
//  Created by Cerebro on 28/06/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MailChimpService {
    
    static let baseUrl = "https://us11.api.mailchimp.com/2.0/";
    static let apiKey = "0b2c80ade9efd31e118ecb6fa2240205-us11"
    
    class func fetchLists(completionHandler: [List] -> Void) {
        
        Alamofire.request(.POST, baseUrl + "lists/list?apikey=" + apiKey).responseJSON (completionHandler: { response in
            
            let json = JSON(response.result.value!)
            
            var fetchedLists = [List]()
            
            for subJson in json["data"].array! {
                fetchedLists.append(List(json: subJson))
            }
            
            print(fetchedLists.count)
            
            completionHandler(fetchedLists)
            
        })
        
        print("fetch list about to complete")
        
    }
    
    class func fetchContacts(listId:String,completionHandler: [Contact] -> Void) {
        
        Alamofire.request(.POST, baseUrl + "lists/members?apikey=" + apiKey + "&id=" + listId).responseJSON (completionHandler: { response in
            
            let json = JSON(response.result.value!)
            
            var fetchedLists = [Contact]()
            
            for subJson in json["data"].array! {
//                fetchedLists.append(Contact(json: subJson))
            }
            
            print(fetchedLists.count)
            
            completionHandler(fetchedLists)
            
        })
        
        print("fetch list about to complete")
        
    }
    
}