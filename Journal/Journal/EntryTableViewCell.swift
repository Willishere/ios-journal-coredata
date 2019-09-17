//
//  EntryTableViewCell.swift
//  Journal
//
//  Created by William Chen on 9/16/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var boldLabel: UILabel!
    
    @IBOutlet weak var journaltextField: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    

    var entryController: EntryController?
    
    
    
    var entry: Entry?{
        didSet{
            updateViews()
        }
    }
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy HH:mm"
        return formatter
    }()
    
    func updateViews(){
        guard let entry = entry else {return}
        
        boldLabel.text = entry.title
        
        journaltextField.text = entry.bodyText
        dateLabel.text = dateFormatter.string(from: entry.timeStamp ?? Date())
        
    }
    
}
