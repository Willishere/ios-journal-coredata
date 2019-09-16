//
//  EntryController.swift
//  Journal
//
//  Created by William Chen on 9/16/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

import Foundation
import CoreData

class EntryController{
    func saveToPersistence(){
        
            do {
                try CoreDataStack.shared.mainContext.save()
            } catch {
                NSLog("Error saving context: \(error)")
                CoreDataStack.shared.mainContext.reset()
            }
        }

    func loadFromPersistence() -> [Entry]{
        
        var entry: [Entry] {
        let fetchRequest: NSFetchRequest<Entry> = Entry.fetchRequest()
        
        do {
            let tasks = try CoreDataStack.shared.mainContext.fetch(fetchRequest)
            return tasks
        } catch {
            NSLog("Error fetching tasks: \(error)")
            return []
        }
    }
    return []
}

@discardableResult func createEntry(with title: String, bodyText: String) -> Entry {
    
    let entry = Entry(title: title, bodyText: bodyText, context: CoreDataStack.shared.mainContext)
    saveToPersistence()
 
    return entry
}

    func updateEntry(entry: Entry, with title: String, with bodyText: String) {
    
    entry.title = title
    entry.bodyText = bodyText
    
    saveToPersistence()
}

func delete(entry: Entry) {
    
    CoreDataStack.shared.mainContext.delete(entry)
    saveToPersistence()
}

}
