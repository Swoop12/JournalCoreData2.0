//
//  Entry+Convience.swift
//  JournalFetchedResultsController
//
//  Created by DevMountain on 9/6/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

import Foundation
import CoreData

extension Entry{
    
    @discardableResult
    convenience init(title: String, body: String, timestamp: Date = Date()){
        
        self.init(context: CoreDataStack.context)
        self.title = title
        self.body = body
        self.timestamp = timestamp
    }
    
}
