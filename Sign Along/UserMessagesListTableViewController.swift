//
//  UserMessagesListTableViewController.swift
//  Sign Along
//
//  Created by Minna Xiao on 12/6/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

//
//  MessagesListTableViewController.swift
//  Sign Along
//
//  Created by Minna Xiao on 12/2/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class UserMessagesListTableViewController: UITableViewController {
    
    
    var messagers = [String]()
    var profilePics = [String]()
    var firstNames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        
        loadSampleMessages()
    }
    
    func loadSampleMessages() {
        messagers = ["Amber Gallego", "Libbey Ketterer", "Anissa"]
        firstNames = ["Amber", "Libbey", "Anissa"]
        profilePics = ["amber.jpg", "libbey.jpg", "anissa.png"]
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
        cell.friendImage.image = UIImage(named: profilePics[indexPath.row])
        
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
                    detailvc.friend = firstNames[chatIndex!]
                    detailvc.inUser = true
                    detailvc.displayList = true

                }
            }
        }
    }
    
}

