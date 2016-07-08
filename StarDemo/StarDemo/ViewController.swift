//
//  ViewController.swift
//  StarDemo
//
//  Created by Cerebro on 08/07/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FiveStarDelegate {

    @IBOutlet weak var firstWidget: FiveStartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstWidget.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ratingGiven(rating: Int, forView: FiveStartView) {
        print("rating given \(rating)")
    }


}

