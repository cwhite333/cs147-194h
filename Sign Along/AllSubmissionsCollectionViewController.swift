//
//  AllSubmissionsCollectionViewController.swift
//  Sign Along
//
//  Created by Minna Xiao on 12/3/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit
import AVFoundation

class AllSubmissionsCollectionViewController: UICollectionViewController {
    
    var event : Event?

    var videos = [VideoItem]()
        
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title  = "Chance the Rapper"
            
            // collectionView!.contentInset = UIEdgeInsets(top: 23, left: 5, bottom: 10, right: 5)
            
    }
        
    override func viewWillAppear(animated: Bool) {
        //initVideoItems()
    }
        
    /*func initVideoItems() {
        videos += [VideoItem(imageName: "asl1.png", creator: "Amber Galloway", track: "Juke Jam", votes: 100, profPic: "chance2.jpg", videoName: "RapGod_Amber"),
                   VideoItem(imageName: "asl2.png", creator: "Bee Adams", track: "All Night", votes: 100, profPic: "chance2.jpg", videoName: "Anaconda_Amber"),
                VideoItem(imageName: "asl3.png", creator: "Anissa Mendes", track: "All Night", votes: 100, profPic: "chance2.jpg", videoName: "RapGod_Amber")]
    }*/
    
    /*func blah() {
        do {
            let path = NSBundle.mainBundle().pathForResource("BackgroundVideo", ofType: "mp4")
           // player = AVPlayer(URL: NSURL(fileURLWithPath: path!))
            let asset = AVURLAsset(URL: NSURL(fileURLWithPath: path!), options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imgGenerator.copyCGImageAtTime(CMTimeMake(0, 1), actualTime: nil)
            let uiImage = UIImage(CGImage: cgImage)
            let imageView = UIImageView(image: uiImage)
            // lay out this image view, or if it already exists, set its image property to uiImage
        } catch let error as NSError {
            print("Error generating thumbnail: \(error)")
        }
    }*/
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationvc: UIViewController? = segue.destinationViewController
        if let identifier = segue.identifier {
     
            if let indexPath = self.collectionView?.indexPathForCell(sender as! AnnotatedVidCell) {
                if identifier == "Show Submission" {
                    if let detailvc = destinationvc as? SubmissionTableViewController {
                        detailvc.video = videos[indexPath.row]
     
                    }
                }
            }
        }
     }
    
}

    extension AllSubmissionsCollectionViewController {
        
        override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return videos.count
            
        }
        
        override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AnnotatedVidCell", forIndexPath: indexPath) as! AnnotatedVidCell
            
            cell.layer.masksToBounds = true;
            cell.layer.cornerRadius = 5;
            cell.video = videos[indexPath.item]
            
            return cell
        }
        
        func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            let leftRightInset = CGFloat(10.0)
            return UIEdgeInsetsMake(10, leftRightInset, 0, leftRightInset)
        }
        
    }

