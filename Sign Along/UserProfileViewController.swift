//
//  UserProfileViewController.swift
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

class UserProfileViewController: UICollectionViewController {
    
    //var photos = Photo.allPhotos()
    
    var videos = [VideoItem]()
    var artist: String?
    var videoProfileMap = [String: [VideoItem]]()
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initPossibleVideosMap()
        if artist != nil {
            videos = videoProfileMap[artist!]!
        }
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func initPossibleVideosMap() {
        let amber_videos = [VideoItem(imageName: "RapGod_Thumbnail.png", creator: "Amber Gallego", track: "Rap God", votes: 100, profPic: "amber2.png", videoName: "RapGod_Amber"),
                   VideoItem(imageName: "Anaconda_Thumbnail.png", creator: "Amber Gallego", track: "Anaconda", votes: 100, profPic: "amber2.png", videoName: "Anaconda_Amber"),
                   VideoItem(imageName: "StressedOut_thumbnail", creator: "Amber Gallego", track: "stressed out", votes: 100, profPic: "amber2.png", videoName: "StressedOut_Amber"), VideoItem(imageName: "MarryMe_amber_thumbnail", creator: "Amber Gallego", track: "Marry Me", votes: 100, profPic: "amber2.png", videoName: "MarryMe_amber")]
        
        
        let libbey_videos = [VideoItem(imageName: "Heathens_libbey_thumbnail.png", creator: "Libbey Ketterer", track: "Heathens", votes: 100, profPic: "libbey.jpg", videoName: "Heathens_libbey"),
                             VideoItem(imageName: "TalkDirty_libbey_thumbnail.png", creator: "Libbey Ketterer", track: "Talk Dirty", votes: 100, profPic: "libbey.jpg", videoName: "TalkDirty_libbey")]
        
        let anissa_videos = [VideoItem(imageName: "TalkDirty_anissa_thumbnail.png", creator: "Anissa", track: "Talk Dirty", votes: 100, profPic: "anissa.png", videoName: "TalkDirty_anissa"),
                             VideoItem(imageName: "StressedOut_anissa_thumbnail.png", creator: "Anissa", track: "stressed out", votes: 100, profPic: "anissa.png", videoName: "StressedOut_anissa")]
        
        let molly_videos = [VideoItem(imageName: "RidinSolo_mbart_thumbnail.png", creator: "Molly Bartholomew", track: "Ridin' Solo", votes: 100, profPic: "molly.jpg", videoName: "RidinSolo_mbart")]
        
        let max_videos = [VideoItem(imageName: "SundayCandy_max_thumbnail.png", creator: "Max Gunter", track: "Sunday Candy", votes: 100, profPic: "max.png", videoName: "SundayCandy_max")]
        
        let kass_videos = [VideoItem(imageName: "CocoaButterKisses_kass_thumbnail.png", creator: "Kassandra DeGrado", track: "Cocoa Butter Kisses", votes: 100, profPic: "kass.jpg", videoName: "CocoaButterKisses_kass")]
        
        let sam_videos = [VideoItem(imageName: "SundayCandy_sam_thumbnail.png", creator: "Samantha Sullinger", track: "Sunday Candy", votes: 100, profPic: "sam.png", videoName: "SundayCandy_sam")]
        
        let erik_videos = [VideoItem(imageName: "earnedIt_erik_thumbnail.png", creator: "Erik Witteborg", track: "Earned It", votes: 100, profPic: "erik.jpg", videoName: "EarnedIt_erik")]
        
        let calysta_videos = [VideoItem(imageName: "earnedIt_calysta_thumbnail.png", creator: "Calysta Manigo", track: "Earned It", votes: 100, profPic: "calysta.jpg", videoName: "EarnedIt_calysta")]
        
        let daniel_videos = [VideoItem(imageName: "cantFeelMyFace_daniel_thumbnail.png", creator: "Daniel Lee Cantu", track: "Can't Feel My Face", votes: 100, profPic: "daniel.jpg", videoName: "CantFeelMyFace_daniel")]
        
        let mrTaz_videos = [VideoItem(imageName: "earnedIt_mrTaz_thumbnail.png", creator: "Mr. Taz", track: "Earned It", votes: 100, profPic: "mrTaz.jpg", videoName: "EarnedIt_mrTaz")]
        
        videoProfileMap["Amber Gallego"] = amber_videos
        videoProfileMap["Libbey Ketterer"] = libbey_videos
        videoProfileMap["Anissa"] = anissa_videos
        videoProfileMap["Molly Bartholomew"] = molly_videos
        videoProfileMap["Max Gunter"] = max_videos
        videoProfileMap["Kassandra DeGrado"] = kass_videos
        videoProfileMap["Samantha Sullinger"] = sam_videos
        videoProfileMap["Erik Witteborg"] = erik_videos
        videoProfileMap["Calysta Manigo"] = calysta_videos
        videoProfileMap["Daniel Lee Cantu"] = daniel_videos
        videoProfileMap["Mr. Taz"] = mrTaz_videos
        
    }
    
}

extension UserProfileViewController {
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
        
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AnnotatedPhotoCell", forIndexPath: indexPath) as! AnnotatedPhotoCell2
        
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
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "ProfileHeader", forIndexPath: indexPath) as! InterpreterProfileHeaderView2
            headerView.imageView.image = UIImage(named: videos[0].creatorProfPic)
            headerView.imageView.layer.masksToBounds = false
            headerView.imageView.layer.borderColor = UIColor.whiteColor().CGColor
            headerView.imageView.layer.cornerRadius = headerView.imageView.frame.size.width/2
            headerView.imageView.clipsToBounds = true
            headerView.nameLabel.text = videos[0].creatorName
            
            headerView.numVideosLabel.text = String(videos.count)
            return headerView
            
        default:
            assert(false, "Unexpected element kind")
        }
        
    }
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationvc: UIViewController? = segue.destinationViewController
        if let identifier = segue.identifier {
            
            if identifier == "Show Chat" {
                if let detailvc = destinationvc as? ChatViewController {
                    detailvc.friend = artist!
                    detailvc.inUser = true
                    detailvc.displayList = false
                    
                }
            }
        }
    }
    
}

