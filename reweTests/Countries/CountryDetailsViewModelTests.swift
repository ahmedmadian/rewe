//
//  CountryDetailsViewModelTests.swift
//  reweTests
//
//  Created by Ahmed Madian on 16.03.24.
//

import XCTest
import RxSwift
import RxTest
import RxRelay
import RxFlow
import Swinject
@testable import rewe

class CountryDetailsViewModelTests: ReweTests {

    private var viewModel: CountryDetailsViewModelType!

    override func setUp() {
        super.setUp()

        Container.test.register(CountryDetailsViewModelType.self) { resolver, country in
            return CountryDetailsViewModel(country: country)
        }
    }

    func testViewDidLoad() {
        // Given
        let navigationTitleObserver = scheduler.createObserver(String.self)
        let countryImageURLObserver = scheduler.createObserver(URL?.self)
        let countryDetailsSectionsObserver = scheduler.createObserver([CountryDetailsSectionModel].self)
        let country = CountryStubs.AUSTRIA

        viewModel = Container.test.resolve(CountryDetailsViewModelType.self, argument: country)
        viewModel.output.navigationTitle.subscribe(navigationTitleObserver).disposed(by: disposeBag)
        viewModel.output.countryImageURL.subscribe(countryImageURLObserver).disposed(by: disposeBag)
        viewModel.output.countryDetailsSections.subscribe(countryDetailsSectionsObserver).disposed(by: disposeBag)

        // When
        viewModel.input.viewDidLoad.accept(())

        // Then
        XCTAssertEqual(navigationTitleObserver.events, [.next(0, country.name.common)])
        XCTAssertEqual(countryImageURLObserver.events, [.next(0, URL(string: country.flags.png))])
        XCTAssertEqual(countryDetailsSectionsObserver.events.count, 1)
        XCTAssertEqual(countryDetailsSectionsObserver.events[0].value.element?.count, 1)
        XCTAssertEqual(countryDetailsSectionsObserver.events[0].value.element?[0].items.count, 5)
    }

    func testClose() {
        // Given
        let stepsObserver = scheduler.createObserver(Step.self)

        viewModel = Container.test.resolve(CountryDetailsViewModelType.self, argument: CountryStubs.AUSTRIA)
        viewModel.output.steps.subscribe(stepsObserver).disposed(by: disposeBag)

        // When
        viewModel.input.close.accept(())

        // Then
        XCTAssertEqual(stepsObserver.events.count, 1)
        XCTAssertEqual(stepsObserver.events.first?.value.element as? CountriesStep, .close)
    }
}
