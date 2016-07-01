//
//  UIViewController+WP.swift
//  WallpapaerDemoApp
//
//  Created by Cerebro on 23/12/15.
//  Copyright © 2015 CodeKamp. All rights reserved.
//

import Foundation
import UIKit
import PKHUD

extension UIViewController {

    func showProgressHUD() {
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
    }

    func showSuccessHUD() {
        PKHUD.sharedHUD.contentView = PKHUDSuccessView()
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 1.0)
    }

    func showErrorHUD(error:String, duration:NSTimeInterval = 5.0) {
        PKHUD.sharedHUD.contentView = PKHUDTextView(text: error)
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: duration)
    }

    func hideHUD() {
        PKHUD.sharedHUD.hide()
    }
}
