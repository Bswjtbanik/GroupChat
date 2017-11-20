//
//  DataService.swift
//  GroupChat
//
//  Created by Biswajit Banik on 11/19/17.
//  Copyright © 2017 Biswajit Banik. All rights reserved.
//

import Foundation
import Firebase
//firebase
let DB_BASE = Database.database().reference()

class DataService{
    //singleton
    static let instance = DataService()
    //private
    private var _REF_BASE = DB_BASE
    private var _REF_USER = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    //public
    var REF_BASE : DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USER : DatabaseReference {
        return _REF_USER
    }
    
    var REF_GROUPS : DatabaseReference {
        return _REF_GROUPS
    }
    
    var REF_FEED : DatabaseReference {
        return _REF_FEED
    }
    
    func createDBUser(uid: String , userdata : Dictionary <String , Any>){
        REF_USER.child("uid").updateChildValues(userdata)
    }

    
    
    
    func registerUser(withEmail email : String , andPassword password : String , userCreationComplete : @escaping (_ status : Bool , _ error: Error?) -> () ){
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                userCreationComplete(false, error)
                return
            }
            let userData = ["provider" : user.providerID , "email" : user.email ]
            DataService.instance.createDBUser(uid: user.uid, userdata: userData)
            userCreationComplete(true, nil)
        }
    }
    
    func loginUser(withEmail email : String , andPassword password : String , loginComplete : @escaping (_ status : Bool , _ error: Error?) -> ()){
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                loginComplete(false, error)
            }
            loginComplete(true, nil)
            
        }
        
    }

    
}
