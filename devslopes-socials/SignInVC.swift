//
//  ViewController.swift
//  devslopes-socials
//
//  Created by Khoi Nguyen on 8/23/16.
//  Copyright © 2016 Khoi Nguyen. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func FacebookLoginBtn(_ sender: AnyObject) {
        
        let FacebookLogin = FBSDKLoginManager()
        
        FacebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result,
            error ) in
            if error != nil {
                print("Cannot login \(error)")
            } else if result?.isCancelled == true {
                print("User cancelled Facebook Auth")
            
            } else {
                print("Successfully auth")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.FirebaseAuthenticate(credential)
            }
        }
    }
    
    func FirebaseAuthenticate(_ credential: FIRAuthCredential) {
        
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            
            if error != nil {
                print("Unable to authenticate with firebase")
            } else {
                print("Succesfully authenticated with firebase")
            }
            
            
        })
        
        
    }
    

}

