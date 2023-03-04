//
//  FormulaOneModel.swift
//  Formula 1 Races
//
//  Created by Giorgio Giannotta on 04/03/23.
//

import Foundation

struct Race: Codable {
    let raceName: String
    let date: String
    let circuit: Circuit
}

struct Circuit: Codable {
    let circuitName: String
}
