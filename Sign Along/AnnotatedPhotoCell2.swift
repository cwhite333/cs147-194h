//
//  AnnotatedPhotoCell2.swift
//  Sign Along
//
//  Created by Minna Xiao on 12/7/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class AnnotatedPhotoCell2: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var trackLabel: UILabel!
    
    var video: VideoItem? {
        didSet {
            if let video = video {
                imageView.image = UIImage(named: video.thumbnailImage)
                trackLabel.text = video.track
                
            }
        }
    }

}
