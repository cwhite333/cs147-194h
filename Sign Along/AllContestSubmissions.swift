//
//  AllContestSubmissions.swift
//  Sign Along
//
//  Created by Minna Xiao on 12/7/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

//
//  PhotoStreamViewController.swift
//
//
//
//

import UIKit
import AVFoundation
import AVKit

class AllContestSubmissions: UICollectionViewController {
    
    //var photos = Photo.allPhotos()
    
    var videos = [VideoItem]()
    
    var event: Event?
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {

    }
    
}

extension AllContestSubmissions {
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
        
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AnnotatedCell", forIndexPath: indexPath) as! AnnotatedSubmissionCell
        
        cell.layer.masksToBounds = true;
        cell.layer.cornerRadius = 5;
        cell.video = videos[indexPath.item]
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let vidName = videos[indexPath.item].videoName
        playVideo(vidName)
        
        
    }
    
    private func playVideo(name: String) {
        let path = NSBundle.mainBundle().pathForResource(name, ofType: "mp4")
        let player = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        let playerController = AVPlayerViewController()
        playerController.player = player
        presentViewController(playerController, animated: true, completion: { () -> Void in
            player.play()
        })
        
    }
    
    /* func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
     let picDimension = self.view.frame.size.width / 3.0
     return CGSizeMake(picDimension, picDimension - 10.0)
     }*/
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        //let leftRightInset = self.view.frame.size.width / 20.0
        let leftRightInset = CGFloat(10.0)
        return UIEdgeInsetsMake(10, leftRightInset, 0, leftRightInset)
    }
    
    override internal func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "ProfileHeader", forIndexPath: indexPath) as! ContestHeaderView
            headerView.concertImage.image = event!.photo
            //headerView.concertImage.layer.masksToBounds = false
            //headerView.concertImage.layer.borderColor = UIColor.whiteColor().CGColor
            //headerView.concertImage.layer.cornerRadius = headerView.concertImage.frame.size.width/2
            //headerView.concertImage.clipsToBounds = true
            headerView.artistLabel.text = event!.artist
            return headerView
            
        default:
            assert(false, "Unexpected element kind")
        }
        
    }
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationvc: UIViewController? = segue.destinationViewController
        if let identifier = segue.identifier {
            if identifier == "Show Profile" {
                if let detailvc = destinationvc as? UserProfileViewController {
                    //detailvc.videos = videos
                    detailvc.artist = (sender as! UIButton).titleLabel!.text
                }
            }
        }
    }
    
}


