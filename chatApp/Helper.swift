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

class Helper {
    static let helper = Helper()
    
    
    func loginAnonymously() {
        print("login anonymously tapped")
        
        FIRAuth.auth()?.signInAnonymously(completion: { (anonymousUser, error) in
            if error == nil {
                print("UserId: \(anonymousUser!.uid)")
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let naviVC = storyboard.instantiateViewController(withIdentifier: "NavigationVC") as! UINavigationController
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = naviVC
                
            } else {
                print("\(error?.localizedDescription)")
                return
            }
        })
        
    }
    
}
