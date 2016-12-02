//
//  FirstSubmissionTableViewCell.swift
//  Sign Along
//
//  Created by Minna Xiao on 11/30/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class FirstSubmissionTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profilePic: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }


}
