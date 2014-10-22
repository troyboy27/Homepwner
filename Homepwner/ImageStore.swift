//
//  ImageStore.swift
//  Homepwner
//
//  Created by Troy Abel on 10/21/14.
//  Copyright (c) 2014 Troy Abel. All rights reserved.
//

import UIKit

class ImageStore: NSObject {
    
    var imageDictionary = [String:UIImage]()
    
    func imagePathForKey(key: String) -> String {
        let documentsDirectories =
        NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDirectory = documentsDirectories.first as String
        
        return documentDirectory.stringByAppendingPathComponent(key)
    }
    
    func setImage(image: UIImage, forKey key: String) {
        imageDictionary[key] = image
    }
    
    func imageForKey(key: String) -> UIImage? {
        return imageDictionary[key]
    }
    
    func deleteImageForKey(key: String) {
        imageDictionary.removeValueForKey(key)
    }
}