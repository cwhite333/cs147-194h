//
//  ChatViewController.swift
//  Sign Along
//
//  Created by Minna Xiao on 12/2/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit
import JSQMessagesViewController


class ChatViewController: JSQMessagesViewController {
    
    var messages = [JSQMessage]()
    var friend = String()
    
    //lazy var outgoingBubbleImageView: JSQMessagesBubbleImage = self.setupOutgoingBubble()
    //lazy var incomingBubbleImageView: JSQMessagesBubbleImage = self.setupIncomingBubble()
    
    
    let outgoingBubbleImageView = JSQMessagesBubbleImageFactory().outgoingMessagesBubbleImageWithColor(UIColor(red: 81/255, green: 189/255, blue: 187/255, alpha: 1.0))
    let incomingBubbleImageView = JSQMessagesBubbleImageFactory().incomingMessagesBubbleImageWithColor(UIColor.lightGrayColor())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = friend
        self.collectionView.backgroundColor = UIColor.blackColor()
        self.tabBarController?.tabBar.hidden = true
        self.setup()
        self.addMessages()
        
        self.collectionView?.reloadData()
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
    
    func addMessages() {
        
        addMessage(withId: "foo", name: friend, text: "Hi! I really love your videos!")
        //messages from local sender
        addMessage(withId: self.senderId, name: self.senderDisplayName, text: "Thanks so much! I'm working on a new video for the upcoming Rihanna concert.")
        
        addMessage(withId: self.senderId, name: self.senderDisplayName, text: "You should check it out.")
        finishReceivingMessage()
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    func setup() {
        self.senderId = "me"
        self.senderDisplayName = "Me"
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageBubbleImageDataSource! {
        let message = messages[indexPath.item]
        if message.senderId == "me" {
            return outgoingBubbleImageView
        } else {
            return incomingBubbleImageView
        }
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAtIndexPath: indexPath) as! JSQMessagesCollectionViewCell
        let message = messages[indexPath.item]
        
        if message.senderId == "me" {
            cell.textView?.textColor = UIColor.whiteColor()
        } else {
            cell.textView?.textColor = UIColor.blackColor()
        }
        
        return cell
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }
    
    private func setupOutgoingBubble() -> JSQMessagesBubbleImage {
        let bubbleImageFactory = JSQMessagesBubbleImageFactory()
        return bubbleImageFactory!.outgoingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleBlueColor())
    }
    
    private func setupIncomingBubble() -> JSQMessagesBubbleImage {
        let bubbleImageFactory = JSQMessagesBubbleImageFactory()
        return bubbleImageFactory!.incomingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleLightGrayColor())
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAtIndexPath indexPath: NSIndexPath!) -> NSAttributedString! {
        let data = self.collectionView(self.collectionView, messageDataForItemAtIndexPath: indexPath)
        if (self.senderDisplayName == data.senderDisplayName()) {
            return nil
        }
        return NSAttributedString(string: data.senderDisplayName())
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        let data = self.collectionView(self.collectionView, messageDataForItemAtIndexPath: indexPath)
        if (self.senderDisplayName == data.senderDisplayName()) {
            return 0.0
        }
        return kJSQMessagesCollectionViewCellLabelHeightDefault
    }
    
    
    private func addMessage(withId id: String, name: String, text: String) {
        if let message = JSQMessage(senderId: id, displayName: name, text: text) {
            messages.append(message)
        }
    }
    
    
    


}

//MARK - Toolbar
extension ChatViewController {
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {
        let message = JSQMessage(senderId: senderId, senderDisplayName: senderDisplayName, date: date, text: text)
        self.messages += [message]
        self.finishSendingMessage()
    }
    
    override func didPressAccessoryButton(sender: UIButton!) {
        
    }
}
