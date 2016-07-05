//
//  User+CoreDataProperties.swift
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

extension User {

    @NSManaged var name: String?
    @NSManaged var email: String?
    @NSManaged var tasks: NSSet?

}
