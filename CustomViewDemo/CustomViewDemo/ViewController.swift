//
//  ViewController.swift
//  CustomViewDemo
//
//  Created by Cerebro on 08/07/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var threeImageView: ThreeImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "Image1")
        threeImageView.imageViewOne.image = image
        threeImageView.imageViewTwo.image = UIImage(named: "Image2")
        threeImageView.imageViewThree.image = UIImage(named: "Image3")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

