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
    static let apiKey = "bce3acd01bc77d3ce0c840258b354172-us11"
    
    class func fetchLists(completionHandler: [List] -> Void, failure:CodeKampError -> Void) {
        
        Alamofire.request(.POST, baseUrl + "lists/list?apikey=" + apiKey).responseJSON (completionHandler: { response in
            
            let json = JSON(response.result.value!)
            
            
            
            
            //we have placed some check to make sure respose is successful
            
            
            if response.response?.statusCode > 299 || response.response?.statusCode < 200 {
                
                failure(CodeKampError(statusCode: response.response!.statusCode, code: json["code"].int!, message: json["error"].string!))
                return
            }
            
            var fetchedLists = [List]()
            
            for subJson in json["data"].array! {
                print(subJson["id"])
                fetchedLists.append(List(json: subJson))
            }
            
            completionHandler(fetchedLists)
            
        })
        
        print("fetch list about to complete")
        
    }
    
    class func fetchContacts(listId:String,completionHandler: [Contact] -> Void) {
        
        Alamofire.request(.POST, baseUrl + "lists/members?apikey=" + apiKey + "&id=" + listId).responseJSON (completionHandler: { response in
            
            let json = JSON(response.result.value!)
            
            var fetchedContacts = [Contact]()
            
            for subJson in json["data"].array! {
                fetchedContacts.append(Contact(json:subJson))
            }
            
            completionHandler(fetchedContacts)
            
        })
        
        print("fetch list about to complete")
        
    }
    
    class func createContact(listId:String, email:String) {
        let params:[String:AnyObject] = [
            "apikey":apiKey,
            "id":listId,
            "email":[
                "email": email
            ],
            "double_optin":false
        ]
        Alamofire.request(.POST, baseUrl + "lists/subscribe", parameters: params).responseJSON (completionHandler: { response in
            
            let json = JSON(response.result.value!)
            
            print(json)
            
        })
    }
    
    class func fetchImage(url:String, success:UIImage -> Void) {
        
        Alamofire.request(.GET, url).responseData { response in
            
            let image = UIImage(data: response.result.value!)
            success(image!)
        }
    }
    
}