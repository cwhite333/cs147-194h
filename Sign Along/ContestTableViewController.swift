//
//  ContestTableViewController.swift
//  Sign Along
//
//  Created by Minna Xiao on 11/29/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class ContestTableViewController: UITableViewController {
    
    // MARK: Properties
    var event: Event?
    var submissions = [VideoItem]()
    var trackFiles = [String]()
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
       //navigationItem.title = "Contest"
        
        //self.navigationController?.navigationBar.translucent = true
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 + event!.tracks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("FirstContestCell", forIndexPath: indexPath) as! FirstContestTableViewCell;
            
            cell.artistLabel.text = event!.artist
            cell.locationLabel.text = event!.location + " • " + event!.city
            cell.dateLabel.text = event!.date + " • " + event!.start_time
            cell.tourLabel.text = event!.name
        
            return cell
            
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("SecondContestCell", forIndexPath: indexPath) as! SecondContestTableViewCell;
            cell.eventImage.image = event!.photo
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier("ThirdContestCell", forIndexPath: indexPath) as! ThirdContestTableViewCell;
            cell.headerLabel.text = "Contest Deadline: " + event!.date
            return cell
            
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCellWithIdentifier("ViewSubCell", forIndexPath: indexPath);
            
            return cell
            
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCellWithIdentifier("FourthContestCell", forIndexPath: indexPath);
            
            return cell
        
        } else {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("TrackContestCell", forIndexPath: indexPath) as! TrackContestTableViewCell;
            
            let tracks = event!.tracks
            let track = tracks[indexPath.row - 5]
            count += 1
            cell.songLabel.text = track.name
            cell.albumLabel.text = track.album
            cell.trackNum.text = String(count)
            
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
            
        } else if indexPath.row == 3 {
            return 50
            
        } else if indexPath.row == 4 {
            return 50
        } else {
            return 50
        }
    }
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationvc: UIViewController? = segue.destinationViewController
        if let identifier = segue.identifier {
            /*if identifier == "Show Tracklist" {
                if let tracklistvc = destinationvc as? TracklistTableViewController {
                    tracklistvc.event = event!
                }
            }*/
                
            if identifier == "Show All Submissions" {
                if let detailvc = destinationvc as? AllContestSubmissions {
                    detailvc.event = event!
                    detailvc.videos = submissions
                }
            } else if identifier == "Show Track Details" {
                if let trackvc = destinationvc as? TrackViewController {
                    trackvc.event = event!
                    
                    let tracks = event!.tracks
                    let trackIndex = (tableView.indexPathForSelectedRow?.row)! - 5
                    trackvc.track = tracks[trackIndex]
                    
                    trackvc.trackFileName = trackFiles[trackIndex]
                    
                }
            }
        }
    }

}
