//
//  Item.swift
//  RandomItems
//
//  Created by Teech on 10/19/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding {
    
    var name: String
    var valueInDollars: Int?
    var serialNumber: String?
    let dateCreated: NSDate
    let itemKey: String
    
    convenience init(random: Bool = false) {
        if random {
            let randomAdjectiveList = ["Fluffy", "Rusty", "Shiny"]
            let randomNounList = ["Bear", "Spork", "Mac"]
            
            let adjectiveIndex = Int(arc4random_uniform(UInt32(randomAdjectiveList.count)))
            let nounIndex = Int(arc4random_uniform(UInt32(randomNounList.count)))
            let name = "\(randomAdjectiveList[adjectiveIndex]) \(randomNounList[nounIndex])"
            
            let value = Int(arc4random_uniform(100))
            
            var serialNumber = ""
            
            // Add three letters
            let letters = ["N", "E", "R", "D"]
            for _ in 0..<4 {
                let randomIndex = Int(arc4random_uniform(UInt32(letters.count)))
                serialNumber = serialNumber + letters[randomIndex]
            }
            
            // And six numbers
            for _ in 0..<7 {
                serialNumber = serialNumber + "\(arc4random_uniform(10))"
            }
            self.init(name: name, valueInDollars: value, serialNumber: serialNumber)
        }
        else {
            self.init(name: "", valueInDollars: nil, serialNumber: nil)
        }
    }
    
    init(name: String, valueInDollars: Int?, serialNumber: String?) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        dateCreated = NSDate()
        
        let uuid = NSUUID()
        itemKey = uuid.UUIDString
        
        super.init()
    }
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(dateCreated, forKey: "dateCreated")
        aCoder.encodeObject(itemKey, forKey: "itemKey")
        if let serialNumber = serialNumber {
        aCoder.encodeObject(serialNumber, forKey: "serialNumber")
        }
        if let valueInDollars = valueInDollars {
        aCoder.encodeInteger(valueInDollars, forKey: "valueInDollars")
        }
    }
    
    required init(coder aDecoder: NSCoder) {
            name = aDecoder.decodeObjectForKey("name") as String
            dateCreated = aDecoder.decodeObjectForKey("dateCreated") as NSDate
            itemKey = aDecoder.decodeObjectForKey("itemKey") as String
            serialNumber = aDecoder.decodeObjectForKey("serialNumber") as? String
            valueInDollars = aDecoder.decodeIntegerForKey("valueInDollars")
            super.init()
    }
    
}
