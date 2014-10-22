//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Troy Abel on 10/21/14.
//  Copyright (c) 2014 Troy Abel. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController, UITableViewDelegate {
    
    let itemStore: ItemStore
    
    @IBOutlet var headerVIew: UIView!

    // Other methods here
    @IBAction func addNewItem(sender: AnyObject) {
        // Make a new index path for the 0th section, last row
        // Create a new Item and add it to the store
        let newItem = itemStore.createItem()
        
        //Figurte out where that item is in the array
        if let index = find(itemStore.allItems, newItem) {
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            
            
            // Insert this new row into the table.
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Top)
            
        }
    }
    
    init (itemStore: ItemStore) {
        self.itemStore = itemStore
        super.init(nibName: nil, bundle: nil)
        
        navigationItem.title = "Homepwner"
        
        // Create a new bar button item that will send
        // addNewItem(_:) to ItemsVIewController
        let addItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addNewItem:");
        
        //Set this bar button item as the right item in the navigationItem
        navigationItem.rightBarButtonItem = addItem
        
        navigationItem.leftBarButtonItem = editButtonItem()
        
        
        
        
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
    
    override func tableView(tableView: UITableView,
            commitEditingStyle editingStyle: UITableViewCellEditingStyle,
            forRowAtIndexPath indexPath: NSIndexPath) {
        
            // If the table view is asking to commit a delete command...
        if editingStyle == .Delete {
            let item = itemStore.allItems[indexPath.row]
        
            // Remove the item from the store
            itemStore.removeItem(item)
            
            // Also remove that row from the table view with an animation
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            }
    }
    
    override func tableView(tableView: UITableView,
                moveRowAtIndexPath sourceIndexPath: NSIndexPath,
                toIndexPath destinationIndexPath: NSIndexPath) {
                // Update the model
                itemStore.moveItemAtIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
    // This code changes the word Delete to Remove for the button in the list view
    override func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String! {
            return "Remove"
    }
    
    override func tableView(tableView: UITableView,
            didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Create a DetailViewController
        let dvc = DetailViewController(itemStore: itemStore)
        
        // Give the detail view controller the item
        let item = itemStore.allItems[indexPath.row]
        dvc.item = item
        showViewController(dvc, sender: self)
    }
    
    override func viewWillAppear(animated: Bool) {
                super.viewWillAppear(animated)
                tableView.reloadData()
    }
    
}


