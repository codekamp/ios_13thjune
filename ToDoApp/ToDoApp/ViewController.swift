//
//  ViewController.swift
//  ToDoApp
//
//  Created by Cerebro on 05/07/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    @IBOutlet weak var todoTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let fetchRequest = NSFetchRequest(entityName: "Todo")
        
        let result = try! appDelegate.managedObjectContext.executeFetchRequest(fetchRequest) as! [Todo]
        
        for task in result {
            
            print(task.title)
            print(task.completed)
            print(task.owner?.name)
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addTodo() {
        let title = todoTextField.text
        
        
        
        let insertedObject = NSEntityDescription.insertNewObjectForEntityForName("Todo", inManagedObjectContext: appDelegate.managedObjectContext) as! Todo
        
        insertedObject.title = title
        insertedObject.completed = true
        
        
        try! appDelegate.managedObjectContext.save()
        
    }
    
}

