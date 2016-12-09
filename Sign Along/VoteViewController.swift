//
//  VoteViewController.swift
//  Sign Along
//
//  Created by Minna Xiao on 12/7/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VoteViewController: UIViewController {
    
    var count = 0
    var videos : [VideoItem]?
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var videoView: UIView!

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var trackLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        
        
        loadNewSubmission()
        
    }
    
    /*override func prefersStatusBarHidden() -> Bool {
        return true
    }*/
    

    @IBAction func changeDislikeVideo(sender: AnyObject) {
        loadNewSubmission()
    }
    
    @IBAction func changeVideo(sender: AnyObject) {
        loadNewSubmission()
    }
    
    @IBAction func finishVoting(sender: AnyObject) {
        
        closeCurrentPlayer()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func loadNewSubmission() {
        if count < videos!.count {
            let video = videos![count]
            
            profileImage.layer.masksToBounds = false
            profileImage.layer.borderColor = UIColor.whiteColor().CGColor
            profileImage.layer.cornerRadius = profileImage.frame.size.width/2
            profileImage.clipsToBounds = true
            profileImage.image = UIImage(named: video.creatorProfPic)
            
            nameLabel.text = video.creatorName
            trackLabel.text = "Track: " + video.track
            
            closeCurrentPlayer()
            playVideo(video.videoName)
            count += 1
        } else {
            closeCurrentPlayer()
            showAlert("Voting Complete", message: "Thanks for voting!")
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertController.view.tintColor = UIColor(red: 81, green: 189, blue: 187)
        
        // Initialize Actions
        let okAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil);
        }
        
        // Add Actions
        alertController.addAction(okAction)
        
        // Present Alert Controller
        self.presentViewController(alertController, animated: true, completion: nil)

    }

    
    private func playVideo(name: String) {
        let path = NSBundle.mainBundle().pathForResource(name, ofType: "mp4")
        player = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        player!.actionAtItemEnd = AVPlayerActionAtItemEnd.None;
        playerLayer = AVPlayerLayer(player: player)
        playerLayer!.frame = self.videoView.bounds
        //playerLayer!.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.videoView.layer.insertSublayer(playerLayer!, atIndex: 0)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(VoteViewController.playerItemDidReachEnd), name: AVPlayerItemDidPlayToEndTimeNotification, object: player!.currentItem)
        player!.seekToTime(kCMTimeZero)
        player!.play()
    }
    
    private func closeCurrentPlayer() {
        if player != nil {
            player!.pause()
            player = nil
            playerLayer!.removeFromSuperlayer()
        }
    }
    
    func playerItemDidReachEnd() {
        player!.seekToTime(kCMTimeZero)
    }

}
