//
//  LoginVC.swift
//  chatApp
//
//  Created by Cody Condon on 2016-11-03.
//  Copyright © 2016 Cody Condon. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var anonymousButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       //anonymous properties
        //set border color and bc width
        anonymousButton.layer.borderWidth = 2.0
        anonymousButton.layer.borderColor = UIColor.white.cgColor
    }

 
    @IBAction func loginAnonymouslyTapped(_ sender: Any) {
        print("login anonymously tapped")
        Helper.helper.loginAnonymously()
        
    }

    @IBAction func googleLoginTapped(_ sender: Any) {
        print("google login tapped ")
        //switch view by setting navigation controller as root view controller
        
        //Create a main storyboard instance
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //From main storboard instantiate a navigation controller
        let naviVC = storyboard.instantiateViewController(withIdentifier: "NavigationVC") as! UINavigationController
        //get the app gelegate
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // set navigation controller as root view controller
        appDelegate.window?.rootViewController = naviVC
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
