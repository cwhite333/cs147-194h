//
//  Event.swift
//  Sign Along
//
//  Created by Minna Xiao on 11/17/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import Foundation
import UIKit

class Event {
    
    // MARK: Properties
    var artist: String
    var name: String
    var photo: UIImage?
    var tracks = [Track]()
    var location: String
    var start_time: String
    var date: String
    var city: String
    
    
    // MARK: Initialization
    
    init?(artist: String, name: String, photo: UIImage?, tracks: [Track], location: String, start_time: String, date: String, city: String) {
        self.artist = artist
        self.name = name
        self.photo = photo
        self.tracks = tracks
        self.location = location
        self.start_time = start_time
        self.date = date
        self.city = city
        
        if name.isEmpty {
            return nil
        }
    }
}
