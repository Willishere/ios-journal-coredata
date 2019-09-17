//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by William Chen on 9/16/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var textViewLabel: UITextView!
    var entryController: EntryController?
    var entry: Entry?{
        didSet{
            updateViews()
        }
    }
    
    func updateViews(){
        if let entry = entry {
            title = entry.title
            titleLabel.text = entry.title
            textViewLabel.text = entry.bodyText
            
        }else {
            title = "Add New Entry"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        if let entry = entry{
            guard let title = titleLabel.text,
                let bodyText = textViewLabel.text else {return}
            
            entryController?.updateEntry(entry: entry, with: title, with: bodyText)
        }else {
            guard let title = titleLabel.text,
                let bodyText = textViewLabel.text else {return}
            
            entryController?.createEntry(with: title, bodyText: bodyText)
        }
        navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
