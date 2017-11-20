//
//  AuthVC.swift
//  GroupChat
//
//  Created by Biswajit Banik on 11/19/17.
//  Copyright © 2017 Biswajit Banik. All rights reserved.
//

import UIKit
import Firebase
import TwitterKit
import FacebookLogin
import FacebookCore



class AuthVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func fbBtnWithPress(_ sender: Any) {
        let manager = LoginManager()
        manager.logIn(readPermissions: [.publicProfile], viewController: self) { (result) in
            switch result {
            case .success:
                let accessToken = AccessToken.current
                guard let accessTokenString = accessToken?.authenticationToken else { return }
                let credentials = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
                Auth.auth().signIn(with: credentials, completion: { (user, error) in
                    
                    if error != nil {
                        print("Something wrong with user")
                        return
                    }
                })
                
                print("Sucessful fb login")
            default:
                break
                
            }
            
        }
        
    }
    
    
    @IBAction func twitterBtnWithPress(_ sender: Any) {
        
        
        Twitter.sharedInstance().logIn { (session, error) in
            
            if error != nil {
                print("Twitter login error: \(String(describing: error?.localizedDescription)) ")
            }
            else {
                guard let token = session?.authToken else { return }
                guard let secret = session?.authTokenSecret else { return }
                let credential = TwitterAuthProvider.credential(withToken: token, secret: secret)
                
                Auth.auth().signIn(with: credential, completion: { (user, error) in
                    
                    if error != nil {
                        print("Failed to login using firebase : \(String(describing: error?.localizedDescription))")
                    }
                    
                })
                print("Successful twitter ")
                
                
            }
            
            
            
        }
    }
    
    @IBAction func gmailBtnWithPress(_ sender: Any) {
    }
    
    
    
    @IBAction func emailBtnWithPress(_ sender: Any) {
        
        
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
        
        
        
    }
}
