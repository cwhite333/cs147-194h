//
//  PhotoStreamViewController.swift
//
//
//
//

import UIKit
import AVFoundation
import AVKit

class PhotoStreamViewController: UICollectionViewController {
  
  //var photos = Photo.allPhotos()
    
    var videos = [VideoItem]()
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    

    
    //collectionView!.backgroundColor = UIColor.clearColor()
   // collectionView!.contentInset = UIEdgeInsets(top: 23, left: 5, bottom: 10, right: 5)
    
    
  }
    
    override func viewWillAppear(animated: Bool) {
        initVideoItems()
    }
    
    func initVideoItems() {
        videos += [VideoItem(imageName: "RapGod_Thumbnail.png", creator: "Amber Gallego", track: "Rap God", votes: 100, profPic: "amber2.png", videoName: "RapGod_Amber"),
                   VideoItem(imageName: "Anaconda_Thumbnail.png", creator: "Amber Gallego", track: "Anaconda", votes: 100, profPic: "amber2.png", videoName: "Anaconda_Amber"),
                   VideoItem(imageName: "StressedOut_thumbnail", creator: "Amber Gallego", track: "Stressed Out", votes: 100, profPic: "amber2.png", videoName: "StressedOut_Amber"), VideoItem(imageName: "MarryMe_amber_thumbnail.png", creator: "Amber Gallego", track: "Marry Me", votes: 100, profPic: "amber2.png", videoName: "MarryMe_amber")]
    }
  
}

extension PhotoStreamViewController {
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return videos.count

  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AnnotatedPhotoCell", forIndexPath: indexPath) as! AnnotatedPhotoCell
    
    cell.layer.masksToBounds = true;
    cell.layer.cornerRadius = 5;
    cell.video = videos[indexPath.item]
    //cell.photo = "pilots.jpg"
    return cell
  }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let vidName = videos[indexPath.item].videoName
        playVideo(vidName)
        
        
    }
    
    private func playVideo(name: String) {
        let path = NSBundle.mainBundle().pathForResource(name, ofType: "mp4")
        let player = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        let playerController = AVPlayerViewController()
        playerController.player = player
        presentViewController(playerController, animated: true, completion: { () -> Void in
            player.play()
        })
        
    }
    
   /* func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let picDimension = self.view.frame.size.width / 3.0
        return CGSizeMake(picDimension, picDimension - 10.0)
    }*/
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        //let leftRightInset = self.view.frame.size.width / 20.0
        let leftRightInset = CGFloat(10.0)
        return UIEdgeInsetsMake(10, leftRightInset, 0, leftRightInset)
    }
  
  override internal func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
    switch kind {
    case UICollectionElementKindSectionHeader:
      let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "ProfileHeader", forIndexPath: indexPath) as! InterpreterProfileHeaderView
      headerView.imageView.image = UIImage(named: "amber2.png")
      headerView.imageView.layer.masksToBounds = false
      headerView.imageView.layer.borderColor = UIColor.whiteColor().CGColor
      headerView.imageView.layer.cornerRadius = headerView.imageView.frame.size.width/2
      headerView.imageView.clipsToBounds = true
      headerView.nameLabel.text = "Amber Galloway Gallego"
      return headerView
      
    default:
      assert(false, "Unexpected element kind")
    }
    
  }
  
}

