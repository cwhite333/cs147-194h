//
//  TrackViewController.swift
//  Sign Along
//
//  Created by Minna Xiao on 11/18/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit
import MobileCoreServices
import AssetsLibrary
import AVFoundation

class TrackViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, AVAudioPlayerDelegate {
    
    // MARK: Properties
    
    var event: Event?
    var track: Track?
    let controller = UIImagePickerController()
    
    var isRecording = false //to differentiate between a recorded video and video from library
    
    // audio variables
    var audioPlayer: AVAudioPlayer!
    var updater: CADisplayLink! = nil //tracks the time into the track
    var updaterRunning: Bool = false //indicates if track was started
    var isPlaying = false //whether music is playing or paused
    var firstPlay = false //has track been started yet
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var audioSlider: UISlider!
  
    
    @IBOutlet weak var trackName: UILabel!
    
    @IBOutlet weak var artistName: UILabel!
    
    
    @IBOutlet weak var recordButton: UIButton!
    
    @IBOutlet weak var uploadButton: UIButton!
    
    @IBOutlet weak var albumCover: UIImageView!
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recordButton.layer.cornerRadius = 5
        recordButton.layer.borderColor = UIColor.whiteColor().CGColor
        uploadButton.layer.cornerRadius = 5
        uploadButton.layer.borderColor = UIColor.whiteColor().CGColor
        
        displaySetUp()
        
        audioSetUp()
        
    }
    
    func displaySetUp() {
        trackName.text = track!.name
        artistName.text = event!.artist
        albumCover.image = track!.photo
    }
    
    /* Audio Player Code */
    
    
    @IBAction func playAudio(sender: AnyObject) {
        
        if let player = audioPlayer {
            //Pause audio if audio is playing
            if isPlaying {
                updateProgress() //update track time
                
                player.pause()
                let playImage = UIImage(named: "play.png")
                //playButton.setImage(playImage, forState: UIControlState.Normal)
                playButton.setBackgroundImage(playImage, forState: UIControlState.Normal)
                isPlaying = false
                
            } else {
                updater = CADisplayLink(target: self, selector: #selector(TrackViewController.updateProgress))
                updater.frameInterval = 1
            
                updater.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
                updaterRunning = true
                
                
                player.play()
                let pauseImage = UIImage(named: "pause.png")

                playButton.setBackgroundImage(pauseImage, forState: UIControlState.Normal)
                isPlaying = true
                
                updateProgress()
                
            }
        }
    }
    
    
    @IBAction func sliderMoved(sender: AnyObject) {
        var wasPlaying = false
        if isPlaying {
            audioPlayer.pause()
            wasPlaying = true
        }
        
        audioPlayer.currentTime = NSTimeInterval(round(audioSlider.value))
        updateProgress()
        
        if wasPlaying {
            audioPlayer.play()
            wasPlaying = false
        }
    }
    
    //updates current time display in minutes
    func updateProgress() {
        //let total = Float(audioPlayer.duration/60)
        let currentTime = Float(audioPlayer.currentTime/60)
        audioSlider.minimumValue = 0.0
        audioSlider.maximumValue = Float(audioPlayer.duration)
        audioSlider.setValue(Float(audioPlayer.currentTime), animated: true)
        //timeLabel.text = NSString(format: "%.2f/%.2f", currentTime, total) as String
        timeLabel.text = NSString(format: "%.2f", currentTime) as String
        
    }
    
    // AVAudioPlayer delegate method - reset when track finishes
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            let playImage = UIImage(named: "play.png")
            //playButton.setImage(playImage, forState: UIControlState.Normal)
            playButton.setBackgroundImage(playImage, forState: UIControlState.Normal)
            isPlaying = false
            audioPlayer.currentTime = 0.0
            updateProgress()
            updater.invalidate()
        }
    }
    
    //Rewind and Fast forward code
    
    /*@IBAction func fastForwardAudio(sender: UIBarButtonItem) {
        if let player = audioPlayer {
            player.pause()
            let forwardTime = 10.00
            let newTime = player.currentTime + forwardTime
            if newTime <= player.duration {
                player.currentTime = newTime
            } else {
                player.currentTime = player.duration
            }
        }
    }
    
    @IBAction func rewindAudio(sender: UIBarButtonItem) {
        if let player = audioPlayer {
            player.pause()
            let rewindTime = 10.00
            let newTime = player.currentTime - rewindTime
            if newTime >= 0.00 {
                player.currentTime = newTime
            } else {
                player.currentTime = 0.00
            }
        }
    }*/
 
    
    // Set up the audio player to play track
    private func audioSetUp() {
        let audioFilePath = NSBundle.mainBundle().pathForResource("AllNight", ofType: "mp3")
        if audioFilePath != nil {
            let audioFileUrl = NSURL.fileURLWithPath(audioFilePath!)
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOfURL: audioFileUrl)
                audioPlayer.prepareToPlay()
            } catch {
                print("cannot play audio")
            }
        }
        audioSlider.continuous = false
    }
    
    override func viewWillDisappear(animated: Bool) {
        if isPlaying {
            audioPlayer.stop()
            
        }
        
        if updaterRunning {
            updater.invalidate()
            updaterRunning = false
        }
        
        super.viewWillDisappear(animated)
    }
    
    /* Video Related Code */
    
    
    @IBAction func recordVideo(sender: AnyObject) {
        if (UIImagePickerController.isSourceTypeAvailable(.Camera)) {
            if (UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil) {
                controller.sourceType = .Camera
                controller.mediaTypes = [kUTTypeMovie as String]
                controller.allowsEditing = false
                controller.showsCameraControls = true
                controller.delegate = self
                
                isRecording = true
                
                presentViewController(controller, animated: true, completion: nil)
            } else {
                showAlert("No Rear Camera", message: "Application cannot access camera")
            }
        } else {
            showAlert("No Camera", message: "Application cannot access camera")
        }

    }
    
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        // Initialize Actions
        let okAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
            print("The user is okay.")
        }
        
        
        // Add Actions
        alertController.addAction(okAction)
        //alertController.addAction(noAction)
        
        // Present Alert Controller
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func uploadVideo(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) == false {
            print("no library available")
            return
        }
        
        controller.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        controller.mediaTypes = [kUTTypeMovie as String]
        controller.delegate = self
        presentViewController(controller, animated: true, completion: nil)
    }
    
       
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let mediaType:AnyObject? = info[UIImagePickerControllerMediaType]
        if let type:AnyObject = mediaType {
            if type is String {
                let stringType = type as! String
                if stringType == kUTTypeMovie as String {
                    let videoURL = info[UIImagePickerControllerMediaURL] as? NSURL
                    print (videoURL)
                    
                    
                    /* if the user just recorded the video, save the video to the photo library */
                    if isRecording {
                        let pathString = videoURL!.relativePath
                        UISaveVideoAtPathToSavedPhotosAlbum(pathString!, self, nil, nil)
                        isRecording = false
                    }
                
                    
                    /* save the video to the app directory */
                    
                    //load video data from URL
                    let videoData = NSData(contentsOfURL: videoURL!)
                    
                    //get documents directory path
                    let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                    let documentsDirectory: AnyObject = paths[0]
                    
                    //append video file name
                    let dataPath = documentsDirectory.stringByAppendingPathComponent("/newVideo.mp4");
                    
                    //write video file data to path
                    videoData?.writeToFile(dataPath, atomically: false)
                    
                    
                    //controller.dismissViewControllerAnimated(true, completion: nil)
                    controller.dismissViewControllerAnimated(true, completion: {
                        self.showAlert("Success", message: "Your video has been submitted.")
                    })
                }
            }
        }
        
        
    }
    
    

}
