//
//  MessageTableViewCell.swift
//  Sign Along
//
//  Created by Minna Xiao on 12/3/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var friendImage: UIImageView!

    @IBOutlet weak var friendName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
