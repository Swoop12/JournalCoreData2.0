//
//  EntryDetailViewController.swift
//  JournalFetchedResultsController
//
//  Created by DevMountain on 9/6/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    @IBOutlet weak var entryTitleTextField: UITextField!
    @IBOutlet weak var entryBodyTextView: UITextView!
    
    //Landing Pad
    var entry: Entry?{
        didSet{
            loadViewIfNeeded()
            updateView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func updateView(){
        entryTitleTextField.text = entry?.title
        entryBodyTextView.text = entry?.body
    }
 
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let title = entryTitleTextField.text, let body = entryBodyTextView.text else {return}
        guard title != "" else {return}
        
        if let entry = entry{
            EntryController.shared.update(entry: entry, newTitle: title, newBody: body)
        }else {
            EntryController.shared.addEntryWith(title: title, body: body)
        }
        self.navigationController?.popViewController(animated: true)
    }
    

}
