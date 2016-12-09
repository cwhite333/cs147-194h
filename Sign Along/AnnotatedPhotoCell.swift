//
//  AnnotatedPhotoCell.swift
//  RWDevCon
//
//  Created by Mic Pringle on 26/02/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class AnnotatedPhotoCell: UICollectionViewCell {
  
    @IBOutlet weak var imageView: UIImageView!


    @IBOutlet weak var commentLabel: UILabel!
  
  var video: VideoItem? {
    didSet {
      if let video = video {
        imageView.image = UIImage(named: video.thumbnailImage)
        commentLabel.text = video.track
        
        
        //imageView.image = UIImage(named: photo)
        
        //captionLabel.text = "Hello"
        //commentLabel.text = "Hi"
      }
    }
  }
  
  
}
