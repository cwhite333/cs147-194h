//
//  UserContestTableViewController.swift
//  Sign Along
//
//  Created by Minna Xiao on 11/30/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class UserContestTableViewController: UITableViewController {

    // MARK: Properties
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationItem.title = "Contest"
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("FirstContestCell", forIndexPath: indexPath) as! FirstContestTableViewCell;
            
            cell.artistLabel.text = event!.artist
            cell.locationLabel.text = event!.location
            cell.dateLabel.text = event!.date
            
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("SecondContestCell", forIndexPath: indexPath) as! SecondContestTableViewCell;
            cell.eventImage.image = event!.photo
            //cell.eventImage.center = cell.center
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier("ThirdContestCell", forIndexPath: indexPath) as! ThirdContestTableViewCell;
            cell.headerLabel.text = "Contest Details"
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("FourthUserContestCell", forIndexPath: indexPath);
            
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 90
            
        } else if indexPath.row == 1 {
            return 190
            
        } else if indexPath.row == 2 {
            return 160
        } else {
            return 50
        }
    }
    
    // MARK: Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationvc: UIViewController? = segue.destinationViewController
        if let identifier = segue.identifier {
            if identifier == "Show Submissions" {
                if let tracklistvc = destinationvc as? VideosViewController {
                    tracklistvc.event = event!
                }
            }
        }
    }
}
