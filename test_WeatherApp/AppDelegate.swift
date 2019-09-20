//
//  AppDelegate.swift
//  test_WeatherApp
//
//  Created by Nurlan Almazov on 9/20/19.
//  Copyright © 2019 Nurlan Toktonaliev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupNavigationBar()
        setupDefaultSettings()
        
        return true
    }
    
    private func setupNavigationBar() {
        UINavigationBar.appearance().barTintColor = UIColor(displayP3Red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UIBarButtonItem.appearance().tintColor = UIColor.white
    }
    
    private func setupDefaultSettings() {
        let userDefaults = UserDefaults.standard
        if userDefaults.value(forKey: "unit") == nil {
            userDefaults.set(Unit.celsius.rawValue, forKey: "unit")
        }
    }
}

