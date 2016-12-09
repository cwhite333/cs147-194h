//
//  AnnotatedSubmissionCell.swift
//  Sign Along
//
//  Created by Minna Xiao on 12/7/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class AnnotatedSubmissionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var trackLabel: UILabel!
    
    @IBOutlet weak var nameButton: UIButton!
    
    var video: VideoItem? {
        didSet {
            if let video = video {
                imageView.image = UIImage(named: video.thumbnailImage)
                nameButton.setTitle(video.creatorName, forState: .Normal)
                trackLabel.text = video.track
                
            }
        }
    }
    
}