//
//  AppDelegate.swift
//  Currency
//
//  Created by Nazhmeddin Babakhanov on 28/07/2020.
//  Copyright © 2020 Nazhmeddin Babakhanov. All rights reserved.
//

import UIKit
import CoreData
import SnapKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window        : UIWindow?
    var appCordinator : AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        appCordinator = AppCoordinator(window: self.window)
        appCordinator?.start()
        setUpNavigationBar()
        return true
    }
}
extension AppDelegate {
    
    //MARK: Setup
    private func setUpNavigationBar() {
        UINavigationBar.appearance().barTintColor = Global.navigationBackgroundColor()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black,.font : Global.boldFont(size: 20.width)]
    }
}

