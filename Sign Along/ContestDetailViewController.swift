//
//  ContestDetailViewController.swift
//  Sign Along
//
//  Created by Minna Xiao on 11/18/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class ContestDetailViewController: UIViewController {
    
    // MARK: Properties
    var event: Event?
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var instructionsText: UITextView!
    
    @IBOutlet weak var eventImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contestSetUp()
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationItem.title = "Contest"
    }
    
    
    func contestSetUp() {
        nameLabel.text = event!.artist + event!.name
        locationLabel.text = event!.location + " - " + event!.city
        dateLabel.text = event!.date
        eventImage.image = event!.photo
        instructionsText.allowsEditingTextAttributes = false
        instructionsText.text = "This contest ends on Nov. 12, 2016. We are looking for someone who is fluent in ASL and fan of Kanye! If you are interested, please select an audition song from the tracklist and create a video of yourself signing the song."
        
    }
    
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationvc: UIViewController? = segue.destinationViewController
        if let identifier = segue.identifier {
            if identifier == "Show Tracklist" {
                if let tracklistvc = destinationvc as? TracklistTableViewController {
                    tracklistvc.event = event!
                }
            }
        }
    }
    

}
