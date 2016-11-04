//
//  Helper.swift
//  chatApp
//
//  Created by Cody Condon on 2016-11-04.
//  Copyright © 2016 Cody Condon. All rights reserved.
//

import Foundation
import FirebaseAuth
import UIKit
import GoogleSignIn

class Helper {
    static let helper = Helper()
    
    
    func loginAnonymously() {
        print("login anonymously tapped")
        
        FIRAuth.auth()?.signInAnonymously(completion: { (anonymousUser, error) in
            if error == nil {
                print("UserId: \(anonymousUser!.uid)")
                
                self.switchToNavigationVC()
                
            } else {
                print("\(error?.localizedDescription)")
                return
            }
        })
    }
    
    func loginWithGoogle(authentication: GIDAuthentication) {
        let credential = FIRGoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("\(error!.localizedDescription)")
                return
            } else {
                print("\(user?.email)")
                print("\(user?.displayName)")
                
                self.switchToNavigationVC()
            }
        })
    }
    
    private func switchToNavigationVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let naviVC = storyboard.instantiateViewController(withIdentifier: "NavigationVC") as! UINavigationController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = naviVC
    }
    
    
    
}
