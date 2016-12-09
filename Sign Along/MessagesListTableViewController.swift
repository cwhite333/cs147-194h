//
//  MessagesListTableViewController.swift
//  Sign Along
//
//  Created by Minna Xiao on 12/2/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class MessagesListTableViewController: UITableViewController {
    
    
    var messagers = [String]()
    var firstNames = [String]()
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        
        loadSampleMessages()
    }
    
    func loadSampleMessages() {
        messagers = ["Miranda Lee", "Wesley James", "David Johnson"]
        firstNames = ["Miranda", "Wesley", "David"]
        pictures = ["stock1.jpg", "team02.jpg", "team04.jpg"]
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messagers.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MessageTableViewCell", forIndexPath: indexPath) as! MessageTableViewCell
        cell.friendName.text = messagers[indexPath.row]
        
        cell.friendImage.layer.masksToBounds = false
        cell.friendImage.layer.borderColor = UIColor.whiteColor().CGColor
        cell.friendImage.layer.cornerRadius = cell.friendImage.frame.size.width/2
        cell.friendImage.clipsToBounds = true
        cell.friendImage.image = UIImage(named: pictures[indexPath.row])
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationvc: UIViewController? = segue.destinationViewController
        if let identifier = segue.identifier {
            
            if identifier == "Show Chat" {
                if let detailvc = destinationvc as? ChatViewController {
                    let chatIndex = tableView.indexPathForSelectedRow?.row
                    //detailvc.senderDisplayName = messagers[chatIndex!]
                    //detailvc.senderId = "abc"
                    detailvc.friend = firstNames[chatIndex!]
                    detailvc.displayList = false
                    
                }
            }
        }
    }

}
