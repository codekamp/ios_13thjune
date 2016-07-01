//
//  WPPhotosViewController.swift
//  WallpapaerDemoApp
//
//  Created by Cerebro on 23/12/15.
//  Copyright © 2015 CodeKamp. All rights reserved.
//

import UIKit
import Kingfisher

private let placeholderPhoto = UIImage(named: Constants.Images.placeholderPhoto)

class WPPhotosViewController: UICollectionViewController {

    var tagTitle:String = "Deadpool" //if nothing set, we show images for deadpool
    var tag:String = "deadpool" //if nothing set, we show images for deadpool

    var photos:[WPPhoto]? {
        didSet {
            self.collectionView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = tagTitle
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        if photos == nil {
            showProgressHUD()

            WPFlickrService.searchImagesWithTag(tag,
                success: { (photos) -> Void in
                    self.photos = photos
                    self.hideHUD()
                },
                failure: {(error) -> Void in
                    self.showErrorHUD(error.message)
            })
        }
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (photos == nil) ? 0:photos!.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Constants.CellReuseIdentifiers.photoCell, forIndexPath: indexPath) as! WPPhotoCell

        cell.backgroundColor = UIColor.blackColor()

        let photoUrl = NSURL(string: photos![indexPath.row].url)!
        cell.imageView.kf_setImageWithURL(photoUrl, placeholderImage: placeholderPhoto)


        return cell
    }

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {

        let storyBoard = UIStoryboard(name: "Main", bundle: nil)

        let photoDetailVC = storyBoard.instantiateViewControllerWithIdentifier(Constants.StoryboardIds.photoDetailViewController) as! WPPhotoDetailViewController

        photoDetailVC.photo = photos![indexPath.row]

        showViewController(photoDetailVC, sender: nil)
    }
}
