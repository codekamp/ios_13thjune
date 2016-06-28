//
//  ViewController.swift
//  NetworkConectivityDemo
//
//  Created by Cerebro on 24/06/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var lists = [List]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        
        
        let a = {
            (incomingLists:[List]) in
            
            self.lists = incomingLists
            self.tableView.reloadData()
        }
        
        
        MailChimpService.fetchLists{
            incomingLists in
            
            self.lists = incomingLists
            self.tableView.reloadData()
        }
        
        print("we have moved ahead")
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("simple_cell")!
        let list = lists[indexPath.row]
        
        cell.textLabel?.text = list.name
        
        return cell
    }
    
    
}

