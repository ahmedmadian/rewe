//
//  reweTests.swift
//  reweTests
//
//  Created by Ahmed Madian on 16.03.24.
//

import XCTest
import Swinject
import RxSwift
import RxTest

class ReweTests: XCTestCase {
    private(set) var disposeBag: DisposeBag!
    private(set) var scheduler: TestScheduler!

    override func setUp() {
        super.setUp()

        setupBaseClass()
    }

    override func setUpWithError() throws {
        try super.setUpWithError()

        setupBaseClass()
    }

    private func setupBaseClass() {
        Container.resetUnitTestRegistrations()
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
    }

    override func tearDownWithError() throws {
        disposeBag = nil
        scheduler = nil

        try super.tearDownWithError()
    }
}
