//
//  ItemCell.swift
//  Homepwner
//
//  Created by Troy Abel on 10/21/14.
//  Copyright (c) 2014 Troy Abel. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
   
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var serialNumberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var thumbnailView: UIImageView!
    
    
    // This code sets the alpha channel of the valueLabel to 0 when entering
    // editing mode- animation is a bonus from iOS and will 'fade' off
    
    override func layoutSubviews () {
        super.layoutSubviews()
        
        if editing {
            valueLabel.alpha = 0.0
        } else {
            valueLabel.alpha = 1.0
        }
    }
    
}


