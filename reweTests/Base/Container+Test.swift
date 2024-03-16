//
//  Container+Test.swift
//  reweTests
//
//  Created by Ahmed Madian on 16.03.24.
//

import Swinject

extension Container {
    static var test: Container!

    static func resetUnitTestRegistrations() {
        Container.test = Container(parent: .main)
    }
}
