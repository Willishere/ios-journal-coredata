//
//  Entry.swift
//  Journal
//
//  Created by Jordan Christensen on 9/17/19.
//  Copyright © 2019 Mazjap Co Technologies. All rights reserved.
//

import Foundation
import CoreData

enum EntryMood: String, CaseIterable{
    case 😁
    case 😯
    case 🤬
    
}

extension Entry {
    var entryRepresentation: EntryRepresentation? {
        guard let title = title,
            let mood = mood,
            let identifier = identifier?.uuidString else { return nil }
        
        return EntryRepresentation(title: title, bodyText: bodyText, identifier: identifier, timeStamp: timeStamp!, mood: mood)
    }
    convenience init(title: String, bodyText: String, mood: EntryMood, identifier: UUID = UUID(), context: NSManagedObjectContext) {
        self.init(context: context)
        self.title = title
        self.bodyText = bodyText
        self.timeStamp = Date()
        self.identifier = identifier
        self.mood = mood.rawValue
        
   
            
        
        }
    @discardableResult convenience init?(entryRepresentation: EntryRepresentation, context: NSManagedObjectContext) {
        guard let identifier = UUID(uuidString: entryRepresentation.identifier),
            let mood = EntryMood(rawValue: entryRepresentation.mood) else { return nil }
        
        self.init(title: entryRepresentation.title,
                  bodyText: entryRepresentation.bodyText ?? "",
                  mood: mood,
                  identifier: identifier,
                  context: context)
        
    }
}

