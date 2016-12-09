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
    var submissions = [VideoItem]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        //navigationItem.title = "Contest"
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("FirstUserContestCell", forIndexPath: indexPath) as! FirstUserContestCell;
            
            cell.artistLabel.text = event!.artist
            cell.locationLabel.text = event!.location + " • " + event!.city
            cell.dateLabel.text = event!.date + " • " + event!.start_time
            cell.tourLabel.text = event!.name
            
            return cell
            
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("SecondUserContestCell", forIndexPath: indexPath) as! SecondUserContestCell;
            cell.eventImage.image = event!.photo
            
            return cell
            
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier("ThirdUserContestCell", forIndexPath: indexPath) as! ThirdUserContestCell;
            cell.headerLabel.text = "Contest closes: " + event!.date
            return cell
        
        } else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCellWithIdentifier("FourthUserContestCell", forIndexPath: indexPath);
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("FifthUserContestCell", forIndexPath: indexPath) as! FifthUserContestCell;
            
            cell.voteButton.layer.cornerRadius = 5
            cell.voteButton.layer.borderColor = UIColor.whiteColor().CGColor
            cell.voteButton.layer.cornerRadius = 5
            cell.voteButton.layer.borderColor = UIColor.whiteColor().CGColor
            
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 110
            
        } else if indexPath.row == 1 {
            return 190
            
        } else if indexPath.row == 2 {
            return 50
        } else if indexPath.row == 3 {
            return 50
        } else {
            return 50
        }
    }
    
    // MARK: Navigation
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        if identifier == "Show Vote" {
            
            if (submissions.isEmpty) {
                
                showNoVidAlert("No Submissions", message: "")
                
                return false
            
            } else {
                return true
            }
        }
        
        // by default, transition
        return true
    }
    
    private func showNoVidAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertController.view.tintColor = UIColor(red: 81, green: 189, blue: 187)
        
        // Initialize Actions
        let okAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
    
        }
        
        // Add Actions
        alertController.addAction(okAction)
        
        // Present Alert Controller
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationvc: UIViewController? = segue.destinationViewController
        if let identifier = segue.identifier {
            if identifier == "Show All Submissions" {
                if let detailvc = destinationvc as? AllContestSubmissions {
                    detailvc.event = event!
                    detailvc.videos = submissions
                 }
            } else if identifier == "Show Vote" {
                if let detailvc = destinationvc as? VoteViewController {
                    detailvc.videos = submissions
                }
            }
        }
    }
}
