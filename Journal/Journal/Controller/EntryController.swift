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
    var entries: [Entry]{return loadFromPersistence()}
    
    func saveToPersistence(){
        
            do {
                try CoreDataStack.shared.mainContext.save()
            } catch {
                NSLog("Error saving context: \(error)")
                CoreDataStack.shared.mainContext.reset()
            }
        }

    func loadFromPersistence() -> [Entry]{
        
        
        let fetchRequest: NSFetchRequest<Entry> = Entry.fetchRequest()
        
        do {
            let entry = try CoreDataStack.shared.mainContext.fetch(fetchRequest)
            return entry
        } catch {
            NSLog("Error fetching tasks: \(error)")
            return []
        }
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
