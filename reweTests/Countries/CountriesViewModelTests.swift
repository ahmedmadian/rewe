//
//  CountriesViewModelTests.swift
//  reweTests
//
//  Created by Ahmed Madian on 16.03.24.
//

import XCTest
import RxSwift
import RxTest
import RxFlow
import Swinject
@testable import rewe

final class CountriesViewModelTests: ReweTests {
    private var apiClientMock: CountryAPIClientTypeMock!
    private var viewModel: CountriesViewModelType!

    override func setUp() {
        super.setUp()

        apiClientMock = CountryAPIClientTypeMock.registerMock()
        Container.test.register(CountriesViewModelType.self) { resolver, region in
            let apiClient: CountryAPIClientType = resolver.resolve(CountryAPIClientType.self)
            return CountriesViewModel(apiClient: apiClient, region: region)
        }
    }

    func testFetchAllCountriesSuccess() {
        // Given
        let region: Region? = nil
        let countries = CountryStubs.ALL_COUNTRIES
        let countriesObserver = scheduler.createObserver([Country].self)
        let viewStateObserver = scheduler.createObserver(ViewState.self)
        apiClientMock.getAllCountriesStub = Observable.just(countries)
        viewModel = Container.test.resolve(CountriesViewModelType.self, argument: region)

        // When
        viewModel.output.viewState
            .bind(to: viewStateObserver)
            .disposed(by: disposeBag)

        viewModel.output.countries
            .bind(to: countriesObserver)
            .disposed(by: disposeBag)

        viewModel.input.viewDidLoad.accept(())

        // Then
        XCTAssertEqual(viewStateObserver.events, [
            .next(0, .loading),
            .next(0, .loaded)
        ])

        XCTAssertEqual(countriesObserver.events, [
            .next(0, countries)
        ])
    }

    func testFetchCountriesInEuropeSuccess() {
        // Given
        let region: Region? = .europe
        let countries = CountryStubs.EUROPE_COUNTRIES
        let countriesObserver = scheduler.createObserver([Country].self)
        let viewStateObserver = scheduler.createObserver(ViewState.self)
        apiClientMock.getCountriesInRegionStub = Observable.just(countries)
        viewModel = Container.test.resolve(CountriesViewModelType.self, argument: region)

        // When
        viewModel.output.viewState
            .bind(to: viewStateObserver)
            .disposed(by: disposeBag)

        viewModel.output.countries
            .bind(to: countriesObserver)
            .disposed(by: disposeBag)

        viewModel.input.viewDidLoad.accept(())

         // Then
        XCTAssertEqual(viewStateObserver.events, [
            .next(0, .loading),
            .next(0, .loaded)
        ])

        XCTAssertEqual(countriesObserver.events, [
            .next(0, countries)
        ])
    }

    func testFetchCountriesError() {
        // Given
        let region: Region? = nil
        let countriesObserver = scheduler.createObserver([Country].self)
        let viewStateObserver = scheduler.createObserver(ViewState.self)
        let error = NSError(domain: "Test", code: 0, userInfo: nil)
        apiClientMock.getAllCountriesStub = .error(error)
        viewModel = Container.test.resolve(CountriesViewModelType.self, argument: region)

        // When
        viewModel.output.viewState
            .bind(to: viewStateObserver)
            .disposed(by: disposeBag)

        viewModel.output.countries
            .bind(to: countriesObserver)
            .disposed(by: disposeBag)

        viewModel.input.viewDidLoad.accept(())

        // Then
        XCTAssertEqual(viewStateObserver.events, [
            .next(0, .loading),
            .next(0, .error)
        ])

        XCTAssertTrue(countriesObserver.events.isEmpty)
    }

    func testSelectedCountryStep() {
        // Given
        let selectedCountry = CountryStubs.AUSTRIA
        let stepObserver = scheduler.createObserver(Step.self)
        let region: Region? = nil
        viewModel = Container.test.resolve(CountriesViewModelType.self, argument: region)

        // When
        viewModel.output.steps
            .bind(to: stepObserver)
            .disposed(by: disposeBag)

        viewModel.input.selectedCountry.accept(selectedCountry)
        
        // Then
        XCTAssertEqual(stepObserver.events.count, 1)
        XCTAssertTrue(stepObserver.events.first?.value.element is CountriesStep)
        XCTAssertEqual(stepObserver.events.first?.value.element as? CountriesStep, .countryDetails(selectedCountry))
    }
}
