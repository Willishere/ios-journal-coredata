//
//  EntryController.swift
//  Journal
//
//  Created by Jordan Christensen on 9/17/19.
//  Copyright © 2019 Mazjap Co Technologies. All rights reserved.
//

import Foundation
import CoreData

class EntryController {
    
    var entries: [Entry] {
        return loadFromPersistentStore()
    }
    
    func saveToPersistentStore() {
        do {
            try CoreDataStack.shared.mainContext.save()
        } catch {
            NSLog("Error saving context: \(error)")
            CoreDataStack.shared.mainContext.reset()
        }
    }
    
    func loadFromPersistentStore() -> [Entry] {
        let fetchRequest: NSFetchRequest<Entry> = Entry.fetchRequest()
        do {
            let entryList = try CoreDataStack.shared.mainContext.fetch(fetchRequest)
            return entryList
        } catch {
            NSLog("Error fetching tasks: \(error)")
            return []
        }
    }
    
    @discardableResult
    func createEntry(with title: String, bodyText: String) -> Entry {
        let entry = Entry(title: title, bodyText: bodyText, context: CoreDataStack.shared.mainContext)
        saveToPersistentStore()
        return entry
    }
    
    func updateEntry(entry: Entry, with title: String, bodyText: String) {
        entry.title = title
        entry.bodyText = bodyText
        entry.timeStamp = Date()
        
        saveToPersistentStore()
    }
    
    func deleteEntry(entry: Entry) {
        CoreDataStack.shared.mainContext.delete(entry)
        saveToPersistentStore()
    }
}
