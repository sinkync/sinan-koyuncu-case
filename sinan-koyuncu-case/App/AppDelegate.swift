//
//  AppDelegate.swift
//  sinan-koyuncu-case
//
//  Created by Sinan Koyuncu on 5.10.2022.
//

import UIKit
import GoogleMaps

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Setup GoogleMaps
        GMSServices.provideAPIKey(Config.googleMapsApiKey)
        
        return true
    }
}

