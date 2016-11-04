//
//  ChatVC.swift
//  chatApp
//
//  Created by Cody Condon on 2016-11-03.
//  Copyright © 2016 Cody Condon. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
