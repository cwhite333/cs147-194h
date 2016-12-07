//
//  AnnotatedVidCell.swift
//  Sign Along
//
//  Created by Minna Xiao on 12/3/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class AnnotatedVidCell: UICollectionViewCell {
    
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var video: VideoItem? {
        didSet {
            if let video = video {
                thumbnailImage.image = UIImage(named: video.thumbnailImage)
                nameLabel.text = video.creatorName
                trackLabel.text = video.track 
               
            }
        }
    }

}
