//
//  Country.swift
//  rewe
//
//  Created by Ahmed Madian on 26.02.24.
//

import Foundation

struct Country: Codable, Equatable {
    let name: Name
    let flags: Flags
    let population: Int
    let region: Region
    let languages: [String: String]?
    let capital: [String]?
}
