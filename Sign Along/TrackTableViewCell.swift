//
//  TrackTableViewCell.swift
//  Sign Along
//
//  Created by Minna Xiao on 11/18/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class TrackTableViewCell: UITableViewCell {
    
    
    // MARK: Properties
    
    
    
    @IBOutlet weak var trackName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
