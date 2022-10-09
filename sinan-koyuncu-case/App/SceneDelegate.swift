//
//  SceneDelegate.swift
//  sinan-koyuncu-case
//
//  Created by Sinan Koyuncu on 5.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let rootVC = PlacesVC()
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(rootViewController: rootVC)
        window?.makeKeyAndVisible()
    }
}

