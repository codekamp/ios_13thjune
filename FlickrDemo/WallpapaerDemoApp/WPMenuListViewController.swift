//
//  WPMenuListViewController.swift
//  WallpapaerDemoApp
//
//  Created by Cerebro on 23/12/15.
//  Copyright © 2015 CodeKamp. All rights reserved.
//

import UIKit

class WPMenuListViewController: UITableViewController {

    var options = [[String:String]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        loadMenuOptions()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return options.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.CellReuseIdentifiers.menuCell, forIndexPath: indexPath)

        cell.textLabel?.text = options[indexPath.row]["title"]

        return cell
    }


    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        let storyBoard = UIStoryboard(name: "Main", bundle: nil)

        let photosVC = storyBoard.instantiateViewControllerWithIdentifier(Constants.StoryboardIds.photosViewController) as! WPPhotosViewController

        photosVC.tagTitle = options[indexPath.row]["title"]!
        photosVC.tag = options[indexPath.row]["slug"]!

        showViewController(photosVC, sender: nil)

    }

    func loadMenuOptions() {

        options.removeAll()

        options.append(["title":"Dog", "slug":"dog"])
        options.append(["title":"Cat", "slug":"cat"])
        options.append(["title":"Car", "slug":"car"])
        options.append(["title":"Superman", "slug":"superman"])
        options.append(["title":"Batman", "slug":"batman"])
    }

}
