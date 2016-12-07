//
//  AllSubmissionsCollectionViewController.swift
//  Sign Along
//
//  Created by Minna Xiao on 12/3/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class AllSubmissionsCollectionViewController: UICollectionViewController {
    
    var event : Event?

    var videos = [VideoItem]()
        
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
            
            // collectionView!.contentInset = UIEdgeInsets(top: 23, left: 5, bottom: 10, right: 5)
            
    }
        
    override func viewWillAppear(animated: Bool) {
        initVideoItems()
    }
        
    func initVideoItems() {
        videos += [VideoItem(imageName: "photo1.png", creator: "John Doe", track: "Rap God", votes: 100, profPic: "chance2.jpg"),
                VideoItem(imageName: "pilots.jpg", creator: "Jane Smith", track: "Rap God", votes: 100, profPic: "chance2.jpg"),
                VideoItem(imageName: "pilots.jpg", creator: "Fred Wilson", track: "Rap God", votes: 100, profPic: "chance2.jpg")]
    }
    
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

