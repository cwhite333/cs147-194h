//
//  VideoItem.swift
//  Sign Along
//
//  Created by Minna Xiao on 11/21/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import Foundation

class VideoItem {
    
    var thumbnailImage: String
    var creatorName: String
    var track: String
    var voteCount: Int
    var creatorProfPic: String //profile pic of interpretor
    
    init(imageName: String, creator: String, track: String, votes: Int, profPic: String) {
        thumbnailImage = imageName
        creatorName = creator
        self.track = track
        voteCount = votes
        creatorProfPic = profPic
    }
    
    //increment vote by one
    func addVote() -> Int {
        voteCount += 1
        return voteCount
    }
}
