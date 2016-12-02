//
//  Track.swift
//  Sign Along
//
//  Created by Minna Xiao on 12/1/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

//
//  Event.swift
//  Sign Along
//
//  Created by Minna Xiao on 11/17/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import Foundation
import UIKit

class Track {
    
    // MARK: Properties
    var name: String
    var album: String
    var photo: UIImage?
    //var audio
    
    // MARK: Initialization
    
    init?(name: String, album: String, photo: UIImage?) {
        self.name = name
        self.album = album
        self.photo = photo
    }
}

