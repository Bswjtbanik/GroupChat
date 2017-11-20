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
    
         
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    }
    
    @IBAction func gmailBtnWithPress(_ sender: Any) {
    }
    
 
    
    @IBAction func emailBtnWithPress(_ sender: Any) {
        
        
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
        
        
        
    }
}
