//
//  MathsTableViewController.swift
//  KidsApp
//
//  Created by Cerebro on 22/06/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import UIKit

class MathsTableViewController: UIViewController, UITableViewDataSource {
    
    var number:Int!
    var upto:Int!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return upto
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("maths_table_view_cell")!
        
        let index = indexPath.row + 1
        let result = number * index
        cell.textLabel?.text = "\(number) x \(index) = \(result)"
        
        return cell
    }
}
