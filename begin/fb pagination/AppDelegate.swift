//
//  AppDelegate.swift
//  fb pagination
//
//  Created by Ymmanuel on 4/20/17.
//  Copyright © 2017 Hedgehog Labs. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        FIRApp.configure()
        
        return true
    }


}

