//
//  TrackTableViewController.swift
//  Sign Along
//
//  Created by Minna Xiao on 12/9/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

/*
import UIKit
import MobileCoreServices
import AssetsLibrary
import AVFoundation

class TrackTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, AVAudioPlayerDelegate {
    
    
    //MARK: Properties
    var event: Event?
    var track: Track?
    let controller = UIImagePickerController()
    
    var trackFileName: String?
    
    var isRecording = false //to differentiate between a recorded video and video from library
    
    // audio variables
    var audioPlayer: AVAudioPlayer!
    var updater: CADisplayLink! = nil //tracks the time into the track
    var updaterRunning: Bool = false //indicates if track was started
    var isPlaying = false //whether music is playing or paused
    var firstPlay = false //has track been started yet
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = ""
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("FirstTrackCell", forIndexPath: indexPath) as! FirstTrackTableViewCell;
            
            cell.artistLabel.text = event!.artist
            cell.locationLabel.text = event!.location + " • " + event!.city
            cell.dateLabel.text = event!.date + " • " + event!.start_time
            cell.tourLabel.text = event!.name
            
            return cell
            
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("SecondTrackCell", forIndexPath: indexPath) as! SecondTrackTableViewCell;
            cell.eventImage.image = event!.photo
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier("ThirdTrackCell", forIndexPath: indexPath) as! ThirdTrackTableViewCell;
            cell.headerLabel.text = "Contest Deadline: " + event!.date
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("FourthTrackCell", forIndexPath: indexPath) as! FourthTrackTableViewCell;
            
            return cell
        
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 110
            
        } else if indexPath.row == 1 {
            return 190
            
        } else if indexPath.row == 2 {
            return 55
            
        } else {
            return 50
            
        }
    }
    
    
}*/
