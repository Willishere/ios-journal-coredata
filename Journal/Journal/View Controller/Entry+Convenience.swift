//
//  Entry+Convenience.swift
//  Journal
//
//  Created by William Chen on 9/16/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

import Foundation
import CoreData

extension Entry {
    convenience init (title: String, bodyText: String, context: NSManagedObjectContext){
        self.init(context: context)
        
        self.title = title
        self.bodyText = bodyText
        
        self.timeStamp = Date()
        self.identifier = "Entry\(Int.random(in: 1...5000))"
        
    }
}
