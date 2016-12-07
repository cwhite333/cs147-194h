//
//  InterpreterProfileViewController.swift
//  Sign Along
//
//  Created by Minna Xiao on 12/3/16.
//  Copyright © 2016 Stanford. All rights reserved.
//
/*
import UIKit
import AVFoundation

class InterpreterProfileViewController: UICollectionViewController {
    
    //var photos = Photo.allPhotos()
    var videos = [VideoItem]()
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        collectionView!.backgroundColor = UIColor.clearColor()
        collectionView!.contentInset = UIEdgeInsets(top: 23, left: 5, bottom: 10, right: 5)
        
        initVideoItems()
        collectionView?.reloadData()
    }
    
    func initVideoItems() {
        videos += [VideoItem(imageName: "/Images/photo1.png", creator: "John Doe", track: "Rap God", votes: 100, profPic: "chance2.jpg"),
                   VideoItem(imageName: "pilots.jpg", creator: "Jane Smith", track: "Rap God", votes: 100, profPic: "chance2.jpg"),
                   VideoItem(imageName: "pilots.jpg", creator: "Fred Wilson", track: "Rap God", votes: 100, profPic: "chance2.jpg")]
    }

    
}

extension InterpreterProfileViewController {
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ThumbnailCell", forIndexPath: indexPath) as! ThumbnailCollectionViewCell
        cell.video = videos[indexPath.item]
        return cell
    }
    
    override internal func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "ProfileHeader", forIndexPath: indexPath)
            headerView.backgroundColor = UIColor.blueColor()
            return headerView
            
        default:
            assert(false, "Unexpected element kind")
        }
        
    }
    
}



/*import UIKit

class InterpreterProfileViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //var videos = [String]()
    var videos = [VideoItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //collectionView!.backgroundColor = UIColor.blackColor()
        collectionView!.contentInset = UIEdgeInsets(top: 23, left: 5, bottom: 10, right: 5)
        
        
        initVideoItems()
        collectionView?.reloadData()
    }
    
    func initVideoItems() {
        videos += [VideoItem(imageName: "pilots.jpg", creator: "John Doe", track: "Rap God", votes: 100, profPic: "chance2.jpg"),
                   VideoItem(imageName: "pilots.jpg", creator: "Jane Smith", track: "Rap God", votes: 100, profPic: "chance2.jpg"),
                   VideoItem(imageName: "pilots.jpg", creator: "Fred Wilson", track: "Rap God", votes: 100, profPic: "chance2.jpg")]
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /*func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 50, height: 200)
    }*/

}


extension InterpreterProfileViewController {
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ThumbnailCell", forIndexPath: indexPath) as! ThumbnailCollectionViewCell
        cell.video = videos[indexPath.item]
        return cell
    }
    
    
    
    override internal func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "ProfileHeader", forIndexPath: indexPath) as! InterpreterProfileHeaderView
            headerView.profilePic.image = UIImage(named: "chance2.jpg")
            headerView.nameLabel.text = "Young Thug"
            return headerView
            
        default:
            assert(false, "Unexpected element kind")
        }
        
    }
}*/*/