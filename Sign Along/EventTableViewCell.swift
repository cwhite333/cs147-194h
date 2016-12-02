//
//  EventTableViewCell.swift
//  Sign Along
//
//  Created by Minna Xiao on 11/17/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    // MARK: Properties

    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!

    @IBOutlet weak var eventLocation: UILabel!
    
    @IBOutlet weak var eventDate: UILabel!
    
    @IBOutlet weak var daysLeftView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
