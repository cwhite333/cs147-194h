//
//  VideosViewController.swift
//  Sign Along
//
//  Created by Minna Xiao on 11/21/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class VideosViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var event: Event?
    
    var videos: [VideoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initVideoItems()
        collectionView.reloadData()
    }
    
    func initVideoItems() {
        videos += [VideoItem(imageName: "photo1.png", creator: "John Doe", track: "Rap God", votes: 100, profPic: "chance2.jpg"),
                   VideoItem(imageName: "photo2.png", creator: "Jane Smith", track: "Rap God", votes: 100, profPic: "chance2.jpg"),
                   VideoItem(imageName: "photo3.png", creator: "Fred Wilson", track: "Rap God", votes: 100, profPic: "chance2.jpg")]
        
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("VideoCollectionViewCell", forIndexPath: indexPath) as! VideoCollectionViewCell
        
        let vid = videos[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: vid.thumbnailImage)
        
        //cell.setVideoItem(vid)
        return cell
    }
    
    
    
    /*
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let commentView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "GalleryItemCommentView", forIndexPath: indexPath) as! GalleryItemCommentView
        
        commentView.commentLabel.text = "Supplementary view of kind \(kind)"
        
        return commentView
    }*/
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        /*let alert = UIAlertController(title: "didSelectItemAtIndexPath:", message: "Indexpath = \(indexPath)", preferredStyle: .Alert)
        
        let alertAction = UIAlertAction(title: "Dismiss", style: .Destructive, handler: nil)
        alert.addAction(alertAction)
        
        self.presentViewController(alert, animated: true, completion: nil)*/
    }
    
    // MARK: - UICollectionViewFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let picDimension = self.view.frame.size.width / 4.0
        return CGSizeMake(picDimension, picDimension)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        let leftRightInset = self.view.frame.size.width / 14.0
        return UIEdgeInsetsMake(0, leftRightInset, 0, leftRightInset)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationvc: UIViewController? = segue.destinationViewController
        if let identifier = segue.identifier {
            
            if let indexPath = self.collectionView?.indexPathForCell(sender as! UICollectionViewCell) {
                if identifier == "Show Submission" {
                    if let detailvc = destinationvc as? SubmissionTableViewController {
                        detailvc.video = videos[indexPath.row]
                   
                    }
                }
            
            }
        
        }
    }
  
}
