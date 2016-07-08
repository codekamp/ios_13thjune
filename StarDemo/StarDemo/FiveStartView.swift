//
//  FiveStartView.swift
//  StarDemo
//
//  Created by Cerebro on 08/07/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import UIKit

@IBDesignable class FiveStartView: UIView {

    @IBOutlet weak var starFive: UIImageView!
    @IBOutlet weak var startFour: UIImageView!
    @IBOutlet weak var startThree: UIImageView!
    @IBOutlet weak var starTwo: UIImageView!
    @IBOutlet weak var starOne: UIImageView!
    
    var delegate:FiveStarDelegate?
    
    let filledImage = UIImage(named: "Filled")
    let emptyImage = UIImage(named: "Empty")
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    
    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        setup()
    }
    
    func setup() {
        //created nib object
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "FiveStartView", bundle: bundle)
        
        //extracted parent view of nib
        let views = nib.instantiateWithOwner(self, options: nil) as! [UIView]
        let view = views[0]
        
        //set size of parent view to match ThreeImageView's size
        view.frame = self.bounds
        
        // set autorising max to make our view felxible in size
        self.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        //add parent view of nib as our subview
        self.addSubview(views[0])
    }

    @IBAction func startOneTapped(sender: UITapGestureRecognizer) {
        
        starOne.image = filledImage
        starTwo.image = emptyImage
        startThree.image = emptyImage
        startFour.image = emptyImage
        starFive.image = emptyImage
        
        delegate?.ratingGiven(1, forView:self)
    }
    
    @IBAction func starTwoTapped(sender: UITapGestureRecognizer) {
        starOne.image = filledImage
        starTwo.image = filledImage
        startThree.image = emptyImage
        startFour.image = emptyImage
        starFive.image = emptyImage
        
        delegate?.ratingGiven(2, forView:self)
    }
    
    @IBAction func starThreeTapped(sender: UITapGestureRecognizer) {
        starOne.image = filledImage
        starTwo.image = filledImage
        startThree.image = filledImage
        startFour.image = emptyImage
        starFive.image = emptyImage
        
        delegate?.ratingGiven(3, forView:self)
    }
    
    @IBAction func starFourTapped(sender: UITapGestureRecognizer) {
        starOne.image = filledImage
        starTwo.image = filledImage
        startThree.image = filledImage
        startFour.image = filledImage
        starFive.image = emptyImage
        
        delegate?.ratingGiven(4, forView:self)
    }
    
    @IBAction func starFiveTapped(sender: UITapGestureRecognizer) {
        starOne.image = filledImage
        starTwo.image = filledImage
        startThree.image = filledImage
        startFour.image = filledImage
        starFive.image = filledImage
        
        delegate?.ratingGiven(5, forView:self)
    }
    
}

protocol FiveStarDelegate {
    func ratingGiven(rating:Int, forView:FiveStartView)
}
