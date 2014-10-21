//
//  Item.swift
//  RandomItems
//
//  Created by Teech on 10/19/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

import Foundation
class Item: NSObject {
    
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: NSDate
    
    override var description: String {
        
        var snString = ""
        if let sn = serialNumber {
            snString = "(\(sn))"
        }
        
        return "\(name) \(snString): Worth $\(valueInDollars), recorded on \(dateCreated)"
        
    }
    
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
            self.init(name: "", valueInDollars: 0, serialNumber: nil)
        }
    }
    
    init(name: String, valueInDollars: Int, serialNumber: String?) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        dateCreated = NSDate()
        
        super.init()
    }
    
    
}
