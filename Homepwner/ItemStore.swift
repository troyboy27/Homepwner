//
//  ItemStore.swift
//  Homepwner
//
//  Created by Troy Abel on 10/21/14.
//  Copyright (c) 2014 Troy Abel. All rights reserved.
//

import UIKit

class ItemStore: NSObject {
    
    
    
    var allItems: [Item] = []
    
    func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
   
}
