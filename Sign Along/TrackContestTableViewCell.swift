//
//  TrackContestTableViewCell.swift
//  Sign Along
//
//  Created by Minna Xiao on 12/1/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class TrackContestTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var songLabel: UILabel!
    
    @IBOutlet weak var albumLabel: UILabel!
    
    @IBOutlet weak var trackNum: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
