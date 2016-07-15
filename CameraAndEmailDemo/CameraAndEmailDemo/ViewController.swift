//
//  ViewController.swift
//  CameraAndEmailDemo
//
//  Created by Cerebro on 15/07/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import UIKit
import MobileCoreServices
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openCamera() {
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .Camera
            imagePicker.allowsEditing = true
            imagePicker.mediaTypes = [kUTTypeMovie as String, kUTTypeImage as String]
            imagePicker.delegate = self
            
            presentViewController(imagePicker, animated: true, completion: nil)
        } else {
            
        }
    }
    
    @IBAction func openPhotoLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .PhotoLibrary
            imagePicker.mediaTypes = [kUTTypeMovie as String, kUTTypeImage as String]
            imagePicker.delegate = self
            
            presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    //    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
    //
    //        imageView.image = image
    //        picker.dismissViewControllerAnimated(true, completion: nil)
    //    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        
        if mediaType == kUTTypeMovie as String  {
            print("a video was captured")
        } else if mediaType == kUTTypeImage as String {
            print("an image was captured")
            let image = info[UIImagePickerControllerEditedImage] as! UIImage
            imageView.image = image
        }
        
        
        
    }
    @IBAction func sendEmail() {
        
        if MFMailComposeViewController.canSendMail() {
            
            let emailVC = MFMailComposeViewController()
            
            emailVC.delegate = self
            emailVC.setSubject("welcome to CodeKamp")
            emailVC.setMessageBody("Hello Students...", isHTML: false)
            emailVC.setToRecipients(["ashishdhama3@gmail.com", "prashant@codekamp.in"])
            
            presentViewController(emailVC, animated: true, completion: nil)
        } else {
            
        }
    }
}

















