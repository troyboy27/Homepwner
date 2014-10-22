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
        
        // Create full path for image
        let imagePath = imagePathForKey(key)
        
        // Turn image into JPEG data
        let data = UIImageJPEGRepresentation(image, 0.5)
        
        // Write it to full path
        data.writeToFile(imagePath, atomically: true)
        
    }
    
    func imageForKey(key: String) -> UIImage? {
            if let existingImage = imageDictionary[key] {
            return existingImage
        }
            else {
            let imagePath = imagePathForKey(key)
            if let imageFromDisk = UIImage(contentsOfFile: imagePath) {
                setImage(imageFromDisk, forKey: key)
                return imageFromDisk
        }
            else {
                return nil }
            }
            
            
    }
    
    func deleteImageForKey(key: String) {
        imageDictionary.removeValueForKey(key)
        
        let imagePath = imagePathForKey(key)
        NSFileManager.defaultManager().removeItemAtPath(imagePath, error: nil)
        
    }
    
    func clearCache(note: NSNotification) {
                    println("Flushing \(imageDictionary.count) images out of the cache")
                    imageDictionary.removeAll(keepCapacity: false)
    }
    
    override init() {
                    super.init()
                    let nc = NSNotificationCenter.defaultCenter()
                    nc.addObserver(self,
                    selector: "clearCache:",
                    name: UIApplicationDidReceiveMemoryWarningNotification,
                    object: nil)
    }
    
}