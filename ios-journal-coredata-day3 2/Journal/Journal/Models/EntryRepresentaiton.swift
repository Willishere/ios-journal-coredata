//
//  EntryRepresentaiton.swift
//  Journal
//
//  Created by William Chen on 9/18/19.
//  Copyright © 2019 Mazjap Co Technologies. All rights reserved.
//

import Foundation

struct EntryRepresentation: Codable, Equatable {
    let title: String
    let bodyText: String?
    let identifier: String
    let timeStamp : Date
    let mood: String
}
