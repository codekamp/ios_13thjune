//
//  Todo+CoreDataProperties.swift
//  ToDoApp
//
//  Created by Cerebro on 05/07/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Todo {

    @NSManaged var title: String?
    @NSManaged var completed: NSNumber?
    @NSManaged var owner: User?

}
