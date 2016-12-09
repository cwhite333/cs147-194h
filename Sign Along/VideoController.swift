//
//  VideoController.swift
//  Sign Along
//
//  Created by Minna Xiao on 12/7/16.
//  Copyright © 2016 Stanford. All rights reserved.
//


import UIKit
import AVKit
import AVFoundation

class VideoController: UIViewController {
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        playVideo()
    }
    
    private func playVideo() {
        let path = NSBundle.mainBundle().pathForResource("RapGod_Amber", ofType: "mp4")
        let player = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        let playerController = AVPlayerViewController()
        playerController.player = player
        presentViewController(playerController, animated: true, completion: { () -> Void in
            player.play()
        })
        
    }
}