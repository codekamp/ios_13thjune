//
//  ViewController.swift
//  TableViewAbes
//
//  Created by Cerebro on 17/06/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var songsTableView: UITableView!
    
    var songs = Song.allSongs()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let songType = NSUserDefaults.standardUserDefaults().stringForKey("song_type") {
            print("only show songs of type " + songType)
            // songs = songs loaded from server
        } else {
            performSegueWithIdentifier("show_genre_vc", sender: nil)
        }
        
        songsTableView.dataSource = self
        songsTableView.delegate = self
        
        let addNewContactButton = UIBarButtonItem(title: "+", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ViewController.addNewContact))
        
        let subtractContactButton = UIBarButtonItem(title: "-", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ViewController.addNewContact))
        
        self.navigationItem.rightBarButtonItems = [subtractContactButton, addNewContactButton]
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return songs.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        let song = songs[row]
        
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
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        songsTableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let songDetailVC = storyboard.instantiateViewControllerWithIdentifier("song_detail_vc") as! SongDetailViewController
        
        
//        songDetailVC.songId = indexPath.row
        showViewController(songDetailVC, sender: nil)
        
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            print("user wants to delete \(indexPath.row)")
            songs.removeAtIndex(indexPath.row)
            songsTableView.reloadData()
        }
    }
    
    func addNewContact() {
        print("add new contact button clicked")
    }
    
}

