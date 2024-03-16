//
//  MainContainer.swift
//  rewe
//
//  Created by Ahmed Madian on 26.02.24.
//

import Swinject

// MARK: - Main Container

extension Container {
    public static let main = Container()

    func registerAllServices() {
        registerAPIServices()
        registerViewModels()
        registerViewControllers()
        registerFlows()
    }
}

// MARK: - Resolver

extension Resolver {
    public func resolve<Service>(_ serviceType: Service.Type) -> Service {
        guard let service = resolve(serviceType, name: nil) else {
            fatalError("RESOLVER: '\(serviceType)' not resolved.")
        }

        return service
    }

    public func resolve<Service, Arg1>(_ serviceType: Service.Type, argument: Arg1) -> Service {
        guard let service = resolve(serviceType, name: nil, argument: argument) else {
            fatalError("RESOLVER: '\(serviceType)' not resolved.")
        }

        return service
    }
}
