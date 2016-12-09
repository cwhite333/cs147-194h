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
    var videoName: String
    
    init(imageName: String, creator: String, track: String, votes: Int, profPic: String, videoName: String) {
        thumbnailImage = imageName
        creatorName = creator
        self.track = track
        voteCount = votes
        creatorProfPic = profPic
        self.videoName = videoName
    }
    
    //increment vote by one
    func addVote() -> Int {
        voteCount += 1
        return voteCount
    }
}
