//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Troy Abel on 10/21/14.
//  Copyright (c) 2014 Troy Abel. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    let itemStore: ItemStore
    
    init (itemStore: ItemStore) {
        self.itemStore = itemStore
        super.init(nibName: nil, bundle: nil)
        
        for _ in 0..<5 {
            self.itemStore.createItem()
        }
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

   
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Create an instance of UITableViewCell, with default appearance
        // and tell it to reuse the cells
            
        // Get a new or recycled cell
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as ItemCell
            
            
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let item = itemStore.allItems[indexPath.row]
        
        // Configure the cell with the Item Information
        cell.nameLabel.text = item.name
        cell.serialNumberLabel.text = item.serialNumber
        cell.valueLabel.text = "$\(item.valueInDollars)"
            
            
        return cell
            
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the NIB file
        let nib = UINib(nibName: "ItemCell", bundle: nil)
            // Register this NIB, which contains the cell
            tableView.registerNib(nib,
            forCellReuseIdentifier: "ItemCell")    
    }
    
}
