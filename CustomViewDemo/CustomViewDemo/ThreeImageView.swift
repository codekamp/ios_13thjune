//
//  ThreeImageView.swift
//  CustomViewDemo
//
//  Created by Cerebro on 08/07/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import UIKit

@IBDesignable class ThreeImageView: UIView {

    @IBOutlet weak var imageViewOne: UIImageView!
    @IBOutlet weak var imageViewTwo: UIImageView!
    @IBOutlet weak var imageViewThree: UIImageView!
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable var image1:UIImage? = nil {
        didSet {
            self.imageViewOne.image = image1
        }
    }
    
    @IBInspectable var image2:UIImage? = nil {
        didSet {
            self.imageViewTwo.image = image2
        }
    }
    
    @IBInspectable var image3:UIImage? = nil {
        didSet {
            self.imageViewThree.image = image3
        }
    }
    
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
        let nib = UINib(nibName: "ThreeImageView", bundle: bundle)
        
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

}
