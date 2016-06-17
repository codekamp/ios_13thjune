//
//  ViewController.swift
//  TableViewAbes
//
//  Created by Cerebro on 17/06/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var songsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songsTableView.dataSource = self
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return Song.allSongs().count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        let song = Song.allSongs()[row]
        
        print("cell for row \(row) requested")
        
        var cell:UITableViewCell
        
        if row % 2 == 0 {
            cell = tableView.dequeueReusableCellWithIdentifier("odd_design")!
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier("even_design")!
        }
        
        cell.textLabel?.text = song.title
        cell.detailTextLabel?.text = song.album
        
        return cell
        
        
        //  github.com/codekamp
    }
}

