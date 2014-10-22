//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Troy Abel on 10/21/14.
//  Copyright (c) 2014 Troy Abel. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var serialNumberField: UITextField!
    @IBOutlet weak var valueField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    
    let itemStore: ItemStore
    var item: Item? {
        didSet {
            navigationItem.title = item?.name
        }
    }
    
    init(itemStore: ItemStore) {
        self.itemStore = itemStore
        super.init(nibName: "DetailViewController", bundle: nil)
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("User init(itemStore:)")
    }
    
    
    // These are examples of marking up copy try option 6 and it
    // will show these. The - creates a line in the list
    
    
    // MARK:- needs to be copy here
    // FIXME: fix me
    // TODO: There's always something...
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        nameField.text = item?.name
        serialNumberField.text = item?.serialNumber
        valueField.text = "\(item?.valueInDollars ?? 0)"
        if let date = item?.dateCreated {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .MediumStyle
            dateFormatter.timeStyle = .NoStyle
            dateLabel.text = dateFormatter.stringFromDate(date)
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        // Clear first responder
        view.endEditing(true)
        
        // "Save" changes to item
        item?.name = nameField.text
        item?.serialNumber = serialNumberField.text
        item?.valueInDollars = valueField.text.toInt()!
        
        
    }
    
}
