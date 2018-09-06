//
//  Model Controller.swift
//  JournalFetchedResultsController
//
//  Created by DevMountain on 9/6/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

import Foundation
import CoreData

class EntryController{
    
    //1) Singleton || Shared Instance
    static let shared = EntryController()
    
    private init(){}
    
    //3)CRUD Functions
    func addEntryWith(title: String, body: String){
        Entry(title: title, body: body)
        saveToPersistentStore()
    }
    
    func delete(entry: Entry){
        entry.managedObjectContext?.delete(entry)
        saveToPersistentStore()
    }
    
    func update(entry: Entry, newTitle: String, newBody: String){
        entry.title = newTitle
        entry.body = newBody
        saveToPersistentStore()
    }
    
    func saveToPersistentStore(){
        do{
            try CoreDataStack.context.save()
        }catch {
            print("There was as error in \(#function) :  \(error) \(error.localizedDescription)")
        }
    }
    
    //Formatting
    func dateAsString(entry: Entry) -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        guard let timestamp = entry.timestamp else {return ""}
        return formatter.string(from: timestamp)
    }
}
