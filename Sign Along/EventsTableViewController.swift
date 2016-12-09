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
    var daysLeft = [String]()
    var submissions = [[VideoItem]]()
    
    var allTracks = [[String]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Contests"
        
        loadSampleEvents()
        loadDaysLeft()
        
        loadVideoItems()
        loadAllTracks()
    }
    
    func loadDaysLeft() {
        daysLeft += ["2", "14", "20", "25", "30"]
    }

    
    func loadSampleEvents() {
        
        //Chance the Rapper
        let photo3 = UIImage(named: "chance2.jpg")!
        
        let tracks3 = [Track(name: "All Night", album: "Coloring Book", photo: UIImage(named: "coloringbook.jpg"))!, Track(name: "Cocoa Butter Kisses", album: "Acid Rap", photo: UIImage(named: "acidRapAlbum.jpg"))!, Track(name: "Sunday Candy", album: "Surf", photo: UIImage(named: "surfAlbum.jpg"))!]
        
        let event3 = Event(artist: "Chance the Rapper", name: "Magnificent Colouring Book Tour", photo: photo3, tracks: tracks3, location: "Bill Graham Civic Center", start_time: "8:00 pm", date: "Tues, Dec 12", city: "San Francisco, CA")!
        
        //Jason Derulo
        let photo5 = UIImage(named: "jason7.jpg")!
        //let tracks4 = ["Starboy", "Party Monster", "False Alarm"]
        let tracks5 = [Track(name: "Talk Dirty", album: "Talk Dirty", photo: UIImage(named: "talkDirtyAlbum.png"))!, Track(name: "Ridin' Solo", album: "Jason Derulo", photo: UIImage(named: "jasonDeruloAlbum.jpg"))!, Track(name: "Marry Me", album: "Tattoos", photo: UIImage(named: "tattoosAlbum.jpg"))!]
        let event5 = Event(artist: "Jason Derulo", name: "Everything is 4", photo: photo5, tracks: tracks5, location: "Oracle Arena", start_time: "9:00 pm", date: "Sat, Dec 31", city: "Oakland, CA")!
        
        //21 Pilots
        let photo2 = UIImage(named: "pilots4.jpg")!
        let tracks2 = [Track(name: "heavydirtysoul", album: "Blurryface", photo: UIImage(named: "blurryface.jpg"))!, Track(name: "stressed out", album: "Blurryface", photo: UIImage(named: "blurryface.jpg"))!, Track(name: "Heathens", album: "Suicide Squad", photo: UIImage(named: "suicidesquad.jpg"))!]
        let event2 = Event(artist: "Twenty One Pilots", name: "Emotional Roadshow", photo: photo2, tracks: tracks2, location: "SAP Center", start_time: "7:00 pm", date: "Fri, Feb 10", city: "San Jose, CA")!
        
        //The Weeknd
        let photo4 = UIImage(named: "weeknd2.jpg")!
        let tracks4 = [Track(name: "Starboy", album: "Starboy", photo: UIImage(named: "starboy.jpg"))!, Track(name: "Earned It", album: "Beauty Behind the Madness", photo: UIImage(named: "EarnedItAlbum.jpg"))!, Track(name: "Can't Feel My Face", album: "Beauty Behind the Madness", photo: UIImage(named: "BeautyBehindtheMadnessAlbum.png"))!]
        let event4 = Event(artist: "The Weeknd", name: "Starboy: Legend of the Fall", photo: photo4, tracks: tracks4, location: "SAP Center", start_time: "8:00 pm", date: "Fri, Apr 28", city: "San Jose, CA")!
        
        //Young Thug
        let photo1 = UIImage(named: "youngthug.jpg")!
        let tracks1 = [Track(name: "Wyclef Jean", album: "No, My Name is Jeffery", photo: UIImage(named: "jeffery.jpg"))!, Track(name: "RiRi", album: "No, My Name is Jeffery", photo: UIImage(named: "jeffery.jpg"))!, Track(name: "Pick Up The Phone", album: "No, My Name is Jeffery", photo: UIImage(named: "jeffery.jpg"))!]
        let event1 = Event(artist: "Young Thug", name: "HIHORSE'D", photo: photo1, tracks: tracks1, location: "The Warfield", start_time: "8:00 pm", date: "Fri, May 5", city: "San Francisco, CA")!
        
        events += [event3, event5, event2, event4, event1]
        
    }
    
    func loadAllTracks() {
        let chanceTracks = ["AllNight", "CocoaButterKisses", "SundayCandy"]
        let jasonTracks = ["TalkDirty", "RidinSolo", "MarryMe"]
        let pilotsTracks = ["HeavyDirtySoul", "StressedOut", "Heathens"]
        let weekndTracks = ["Starboy", "EarnedIt", "CantFeelMyFace"]
        let thugTracks = ["WyclefJean", "RiRi", "PickUpThePhone"]
        
        
        allTracks += [chanceTracks, jasonTracks, pilotsTracks, weekndTracks, thugTracks]
    }
    
    func loadVideoItems() {
        //Chance The Rapper
        let chanceVids = [VideoItem(imageName: "SundayCandy_max_thumbnail.png", creator: "Max Gunter", track: "Sunday Candy", votes: 100, profPic: "max.png", videoName: "SundayCandy_max"), VideoItem(imageName: "CocoaButterKisses_kass_thumbnail.png", creator: "Kassandra DeGrado", track: "Cocoa Butter Kisses", votes: 100, profPic: "kass.jpg", videoName: "CocoaButterKisses_kass"), VideoItem(imageName: "SundayCandy_sam_thumbnail.png", creator: "Samantha Sullinger", track: "Sunday Candy", votes: 100, profPic: "sam.png", videoName: "SundayCandy_sam")]
        
        //Jason Derulo
        let jasonVids = [VideoItem(imageName: "MarryMe_amber_thumbnail.png", creator: "Amber Gallego", track: "Marry Me", votes: 100, profPic: "amber2.png", videoName: "MarryMe_amber"),
                         VideoItem(imageName: "TalkDirty_anissa_thumbnail.png", creator: "Anissa", track: "Talk Dirty", votes: 100, profPic: "anissa.png", videoName: "TalkDirty_anissa"),
                         VideoItem(imageName: "TalkDirty_libbey_thumbnail", creator: "Libbey Ketterer", track: "Talk Dirty", votes: 100, profPic: "libbey.jpg", videoName: "TalkDirty_libbey"), VideoItem(imageName: "RidinSolo_mbart_thumbnail", creator: "Molly Bartholomew", track: "Ridin' Solo", votes: 100, profPic: "molly.jpg", videoName: "RidinSolo_mbart")]
        
        //Twenty One Pilots
        let pilotsVids = [VideoItem(imageName: "StressedOut_Thumbnail.png", creator: "Amber Gallego", track: "stressed out", votes: 100, profPic: "amber2.png", videoName: "StressedOut_Amber"),
                          VideoItem(imageName: "StressedOut_anissa_thumbnail.png", creator: "Anissa", track: "stressed out", votes: 100, profPic: "anissa.png", videoName: "StressedOut_anissa"),
                          VideoItem(imageName: "Heathens_libbey_thumbnail", creator: "Libbey Ketterer", track: "Heathens", votes: 100, profPic: "libbey.jpg", videoName: "Heathens_libbey")]
        
        //The Weeknd
        let weekndVids = [VideoItem(imageName: "earnedIt_erik_thumbnail.png", creator: "Erik Witteborg", track: "Earned It", votes: 100, profPic: "erik.jpg", videoName: "EarnedIt_erik"),
                          VideoItem(imageName: "earnedIt_calysta_thumbnail.png", creator: "Calysta Manigo", track: "Earned It", votes: 100, profPic: "calysta.jpg", videoName: "EarnedIt_calysta"),
                          VideoItem(imageName: "cantFeelMyFace_daniel_thumbnail.png", creator: "Daniel Lee Cantu", track: "Can't Feel My Face", votes: 100, profPic: "daniel.jpg", videoName: "CantFeelMyFace_daniel"),
                          VideoItem(imageName: "earnedIt_mrTaz_thumbnail.png", creator: "Mr. Taz", track: "Earned It", votes: 100, profPic: "mrTaz.jpg", videoName: "EarnedIt_mrTaz")]
        
        let thugVids = [VideoItem]()
        
        
        //Jason Derulo
        submissions += [chanceVids, jasonVids, pilotsVids, weekndVids, thugVids]
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
        
        cell.daysLeftLabel.text = daysLeft[indexPath.row]
        
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
                    detailvc.submissions = submissions[eventIndex!]
                    detailvc.trackFiles = allTracks[eventIndex!]
                }
            }
        }
    }
    
}
