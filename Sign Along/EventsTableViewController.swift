//
//  EventsTableViewController.swift
//  Sign Along
//
//  Created by Minna Xiao on 11/17/16.
//  Copyright © 2016 Stanford. All rights reserved.
//


import UIKit
import CoreData

class EventsTableViewController: UITableViewController {
    
    // MARK: Properties
    var events = [Event]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Contests"
        
        loadSampleEvents()
    }
    
    func loadSampleEvents() {
        //Young Thug
        let photo1 = UIImage(named: "youngthug.jpg")!
        //let tracks1 = ["Wyclef Jean", "RiRi", "Pick Up The Phone"]
        let tracks1 = [Track(name: "Wyclef Jean", album: "No, My Name is Jeffery", photo: UIImage(named: "jeffery.jpg"))!, Track(name: "RiRi", album: "No, My Name is Jeffery", photo: UIImage(named: "jeffery.jpg"))!, Track(name: "Pick Up The Phone", album: "No, My Name is Jeffery", photo: UIImage(named: "jeffery.jpg"))!]
        let event1 = Event(artist: "Young Thug", name: "HIHORSE'D", photo: photo1, tracks: tracks1, location: "The Warfield", start_time: "8:00 pm", date: "Fri, Dec 9", city: "San Francisco, CA")!
        
        //21 Pilots
        let photo2 = UIImage(named: "pilots4.jpg")!
        let tracks2 = [Track(name: "heavydirtysoul", album: "Blurryface", photo: UIImage(named: "blurryface.jpg"))!, Track(name: "stressed out", album: "Blurryface", photo: UIImage(named: "blurryface.jpg"))!, Track(name: "tear in my heart", album: "Blurryface", photo: UIImage(named: "blurryface.jpg"))!]
        let event2 = Event(artist: "Twenty One Pilots", name: "Emotional Roadshow", photo: photo2, tracks: tracks2, location: "SAP Center", start_time: "7:00 pm", date: "Fri, Feb 10", city: "San Jose, CA")!
    
        //Chance the Rapper
        let photo3 = UIImage(named: "chance2.jpg")!
        //let tracks3 = ["All Night", "No Problem", "Juke Jam"]
        
        let tracks3 = [Track(name: "All Night", album: "Coloring Book", photo: UIImage(named: "coloringbook.jpg"))!, Track(name: "No Problem", album: "Coloring Book", photo: UIImage(named: "coloringbook.jpg"))!, Track(name: "Juke Jam", album: "Coloring Book", photo: UIImage(named: "coloringbook.jpg"))!]
        
        let event3 = Event(artist: "Chance the Rapper", name: "Magnificent Colouring Book Tour", photo: photo3, tracks: tracks3, location: "Bill Graham Civic Center", start_time: "8:00 pm", date: "Tues, Dec 12", city: "San Francisco, CA")!
        
        //The Weeknd
        let photo4 = UIImage(named: "weeknd2.jpg")!
        //let tracks4 = ["Starboy", "Party Monster", "False Alarm"]
        let tracks4 = [Track(name: "Starboy", album: "Starboy", photo: UIImage(named: "starboy.jpg"))!, Track(name: "Party Monster", album: "Starboy", photo: UIImage(named: "starboy.jpg"))!, Track(name: "False Alarm", album: "Starboy", photo: UIImage(named: "starboy.jpg"))!]
        let event4 = Event(artist: "The Weeknd", name: "Starboy: Legend of the Fall", photo: photo4, tracks: tracks4, location: "SAP Center", start_time: "8:00 pm", date: "Fri, Apr 28", city: "San Jose, CA")!
        
        events += [event1, event3, event2, event4]
        
    }

    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return events.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("EventTableViewCell", forIndexPath: indexPath) as! EventTableViewCell;
        
        let event = events[indexPath.row]
        cell.eventName.text = event.artist
        cell.photoImageView.image = event.photo
        cell.eventLocation.text = event.location + " - " + event.city
        cell.eventDate.text = event.date
        
        //set the days left view UI
        cell.daysLeftView.layer.cornerRadius = 5.0
        cell.daysLeftView.layer.borderWidth = 1
        cell.daysLeftView.layer.borderColor = UIColor.whiteColor().CGColor
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 160
    }
    
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationvc: UIViewController? = segue.destinationViewController
        if let identifier = segue.identifier {
            
            if identifier == "Show Contest" {
                if let detailvc = destinationvc as? ContestTableViewController {
                    let eventIndex = tableView.indexPathForSelectedRow?.row
                    detailvc.event = events[eventIndex!]
                }
            }
        }
    }
    
    
    
}
