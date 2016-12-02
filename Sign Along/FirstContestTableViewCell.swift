//
//  FirstContestTableViewCell.swift
//  Sign Along
//
//  Created by Minna Xiao on 11/29/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class FirstContestTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var tourLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
