//
//  CoreDataStack.swift
//  JournalFetchedResultsController
//
//  Created by DevMountain on 9/6/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack{
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "JournalFetchedResultsController")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error{
                fatalError("Failed to load from Persistent store")
            }
        })
        return container
    }()
    
    static var context: NSManagedObjectContext{
        return container.viewContext
    }
    
}
