//
//  VideosCollectionViewController.swift
//  Sign Along
//
//  Created by Minna Xiao on 11/21/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit
import Foundation

class VideosCollectionViewController: UICollectionViewController {
    
    // MARK: Properties
    

    
    var videos: [String] = []
    
    override func viewWillAppear(animated: Bool) {
        videos += ["photo1.png", "photo2.png", "photo3.png"]
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAt indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ThumbnailCell", forIndexPath: indexPath) as! VideoCollectionViewCell
        let thumbnailName = videos[indexPath.item]
        
        let photo = UIImage(named: thumbnailName)!
        cell.thumbnailImageView.image = photo
        
        
        return cell

    }
    

}
