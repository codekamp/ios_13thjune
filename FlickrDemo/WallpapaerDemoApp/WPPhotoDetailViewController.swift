//
//  WPPhotoDetailViewController.swift
//  WallpapaerDemoApp
//
//  Created by Cerebro on 23/12/15.
//  Copyright © 2015 CodeKamp. All rights reserved.
//

import UIKit
import AssetsLibrary

class WPPhotoDetailViewController: UIViewController {

    var photo:WPPhoto?

    @IBOutlet weak var photoImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = photo!.title
        photoImageView.kf_setImageWithURL(NSURL(string: photo!.url)!)
    }

    @IBAction func savePhoto() {

        showProgressHUD()

        let imageData = UIImageJPEGRepresentation(photoImageView.image!, 0)

        ALAssetsLibrary().writeImageDataToSavedPhotosAlbum(imageData, metadata: nil, completionBlock: nil)
        showSuccessHUD()
    }
}
