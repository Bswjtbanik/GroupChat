//
//  AppDelegate.swift
//  GroupChat
//
//  Created by Biswajit Banik on 11/18/17.
//  Copyright © 2017 Biswajit Banik. All rights reserved.
//

import UIKit
import Firebase
import TwitterKit
import FacebookCore
import FacebookLogin


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        FirebaseApp.configure()
        
        if Auth.auth().currentUser == nil {
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main )
            let authVC =  storyboard.instantiateViewController(withIdentifier: "AuthVC")
            window?.makeKeyAndVisible()
            window?.rootViewController?.present(authVC, animated: true, completion: nil)
        }
        
        //facebook login
        	SDKApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        //twitter login
        Twitter.sharedInstance().start(withConsumerKey: "3LXKCxtqHZcO5vK7OYEQXkTt3", consumerSecret: "qpmkgBumw3QfcN26weOPdt8lbb1o0m8DSEvZbIhxNgIYyBMySr")
        
        
        return true
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let twitterlogin = Twitter.sharedInstance().application(app, open: url, options: options)
        
        let fblogin = SDKApplicationDelegate.shared.application(app, open: url, options: options)
        
        return twitterlogin || fblogin
    }
    
    
    
    
    
    func applicationWillResignActive(_ application: UIApplication) {
       
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

