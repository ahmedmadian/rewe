//
//  SceneDelegate.swift
//  rewe
//
//  Created by Ahmed Madian on 26.02.24.
//

import UIKit
import RxFlow

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene

        let homeFlow = HomeFlow()
        FlowCoordinator().coordinate(flow: homeFlow, with: DefaultStepper())
        Flows.use(homeFlow, when: .created) { [weak self] root in
            self?.window?.rootViewController = root
            self?.window?.makeKeyAndVisible()
        }
    }
}

