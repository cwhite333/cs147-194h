//
//  FirstUserContestCell.swift
//  Sign Along
//
//  Created by Minna Xiao on 12/6/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class FirstUserContestCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var tourLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
