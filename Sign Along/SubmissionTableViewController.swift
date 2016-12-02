//
//  SubmissionTableViewController.swift
//  Sign Along
//
//  Created by Minna Xiao on 11/30/16.
//  Copyright © 2016 Stanford. All rights reserved.
//
import UIKit
import AVFoundation

class SubmissionTableViewController: UITableViewController {
    
    // MARK: Properties
    var event: Event?
    
    var video: VideoItem?
    
    var player: AVPlayer?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationItem.title = "Submission"
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("FirstSubmissionCell", forIndexPath: indexPath) as! FirstSubmissionTableViewCell
            
            //var image: UIImage = UIImage(named: "youngthug.jpg")!
            cell.profilePic.layer.masksToBounds = false
            cell.profilePic.layer.borderColor = UIColor.whiteColor().CGColor
            cell.profilePic.layer.cornerRadius = cell.profilePic.frame.size.width/2
            cell.profilePic.clipsToBounds = true
            cell.nameLabel.text = video!.creatorName
            cell.profilePic.image = UIImage(named: video!.creatorProfPic)
            
            return cell
            
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("SecondSubmissionCell", forIndexPath: indexPath) as! SecondSubmissionTableViewCell
            
            
            let path = NSBundle.mainBundle().pathForResource("BackgroundVideo", ofType: "mp4")
            player = AVPlayer(URL: NSURL(fileURLWithPath: path!))
            player!.actionAtItemEnd = AVPlayerActionAtItemEnd.None;
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = cell.videoView.frame
            playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            cell.videoView.layer.insertSublayer(playerLayer, atIndex: 0)
            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SubmissionTableViewController.playerItemDidReachEnd), name: AVPlayerItemDidPlayToEndTimeNotification, object: player!.currentItem)
            player!.seekToTime(kCMTimeZero)
            player!.play()
            
            
            

            return cell
            
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("ThirdSubmissionCell", forIndexPath: indexPath) as! ThirdSubmissionTableViewCell
            cell.voteCountLabel.text = "4000 likes"
            
            return cell
        
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 70
            
        } else if indexPath.row == 1 {
            return 350
            
        } else {
            return 60
        }
    }

    
    func playerItemDidReachEnd() {
        player!.seekToTime(kCMTimeZero)
    }
    
    // MARK: Navigation
    
    /*
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationvc: UIViewController? = segue.destinationViewController
        if let identifier = segue.identifier {
            if identifier == "Show Tracklist" {
                if let tracklistvc = destinationvc as? TracklistTableViewController {
                    tracklistvc.event = event!
                }
            }
        }
    }*/

}
