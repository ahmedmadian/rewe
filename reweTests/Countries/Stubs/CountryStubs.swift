//
//  CountryStubs.swift
//  reweTests
//
//  Created by Ahmed Madian on 16.03.24.
//

@testable import rewe

struct CountryStubs {
    static let AUSTRIA = Country(name: Name(common: "Austria", official: "Republic of Austria"),
                                 flags: Flags(png: "https://flagcdn.com/w320/at.png"),
                                 population: 8917205,
                                 region: .europe,
                                 languages: ["de": "German"], capital: ["Vienna"])

    static let ALL_COUNTRIES = [Country(name: Name(common: "Bermuda", official: "Bermuda"),
                                        flags: Flags(png: "https://flagcdn.com/w320/bm.png"),
                                        population: 63903,
                                        region: .americas,
                                        languages: ["eng": "English"],
                                        capital: ["Hamilton"]),
                                Country(name: Name(common: "Somalia", official: "Federal Republic of Somalia"),
                                        flags: Flags(png: "https://flagcdn.com/w320/so.png"),
                                        population: 15893219,
                                        region: .africa,
                                        languages: ["ara": "Arabic", "som": "Somali"],
                                        capital: ["Mogadishu"]),
                                Country(name: Name(common: "Croatia", official: "Republic of Croatia"),
                                        flags: Flags(png: "https://flagcdn.com/w320/hr.png"),
                                        population: 4047200,
                                        region: .europe,
                                        languages: ["hrv": "Croatian"],
                                        capital: ["Zagreb"]),
                                AUSTRIA]

    static let EUROPE_COUNTRIES = [Country(name: Name(common: "Spain", official: "Kingdom of Spain"),
                                           flags: Flags(png: "https://flagcdn.com/w320/es.png"),
                                           population: 47351567,
                                           region: .europe,
                                           languages: ["glc": "Galician", "cat": "Catalan", "eus": "Basque", "spa": "Spanish"],
                                           capital: ["Madrid"]),
                                   AUSTRIA]
}






