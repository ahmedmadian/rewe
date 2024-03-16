//
//  SceneDelegate.swift
//  rewe
//
//  Created by Ahmed Madian on 26.02.24.
//

import UIKit
import RxFlow
import Swinject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let coordinator = FlowCoordinator()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene

        Container.main.registerAllServices()

        let homeFlow: HomeFlow = Container.main.resolve(HomeFlow.self)
        coordinator.coordinate(flow: homeFlow, with: DefaultStepper())
        Flows.use(homeFlow, when: .created) { [weak self] root in
            self?.window?.rootViewController = root
            self?.window?.makeKeyAndVisible()
        }
    }
}

