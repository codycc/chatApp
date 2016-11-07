//
//  ChatVC.swift
//  chatApp
//
//  Created by Cody Condon on 2016-11-03.
//  Copyright © 2016 Cody Condon. All rights reserved.
//

import UIKit
import JSQMessagesViewController




class ChatVC: JSQMessagesViewController {

    var messages = [JSQMessage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.senderId = "1"
        self.senderDisplayName = "CODY"

        // Do any additional setup after loading the view.
    }
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        print("press send button")
        print("\(text)")
        print("\(senderId)")
        print("\(senderDisplayName)")
        messages.append(JSQMessage(senderId: senderId, displayName: senderDisplayName, text: text))
        print(messages)
    }
    
    override func didPressAccessoryButton(_ sender: UIButton!) {
        print("didpressaccessorybutton")
    }

 
   
    @IBAction func logoutTapped(_ sender: Any) {
        
        //Create a main storyboard instance
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //From main storboard instantiate a view controller
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        //get the app gelegate
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // set  loginVC view controller as root view controller
        appDelegate.window?.rootViewController = loginVC
        
    }

}
