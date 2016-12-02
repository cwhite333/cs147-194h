//
//  TracklistTableViewController.swift
//  Sign Along
//
//  Created by Minna Xiao on 11/18/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class TracklistTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var event: Event?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Tracklist"
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return event!.tracks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TrackTableViewCell", forIndexPath: indexPath) as! TrackTableViewCell;
        
        let tracks = event!.tracks
        let trackIndex = indexPath.row
        cell.trackName.text = tracks[trackIndex].name
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 55
    }
    
    
    // MARK: Navigation
    
    //this should segue to the track screen for create or upload
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationvc: UIViewController? = segue.destinationViewController
        if let identifier = segue.identifier {
            if identifier == "Show Track Details" {
                if let detailvc = destinationvc as? TrackViewController {
                    let trackIndex = tableView.indexPathForSelectedRow?.row
                    let tracks = event!.tracks
                    detailvc.event = event!
                    detailvc.track = tracks[trackIndex!]
                    
                }
            }
        }
    }
    
    
    

}
