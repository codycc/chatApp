//
//  LoginVC.swift
//  chatApp
//
//  Created by Cody Condon on 2016-11-03.
//  Copyright © 2016 Cody Condon. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginVC: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    @IBOutlet weak var anonymousButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       //anonymous properties
        //set border color and bc width
        anonymousButton.layer.borderWidth = 2.0
        anonymousButton.layer.borderColor = UIColor.white.cgColor
        
        GIDSignIn.sharedInstance().clientID = CLIENT_ID
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
    }

 
    @IBAction func loginAnonymouslyTapped(_ sender: Any) {
        print("login anonymously tapped")
        Helper.helper.loginAnonymously()
    }

    @IBAction func googleLoginTapped(_ sender: Any) {
        print("google login tapped ")
        GIDSignIn.sharedInstance().signIn()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            print("\(error.localizedDescription)")
            return 
        }
        print(user.authentication)
        Helper.helper.loginWithGoogle(authentication:user.authentication)
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
