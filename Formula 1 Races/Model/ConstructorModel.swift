//
//  ConstructorModel.swift
//  Formula 1 Races
//
//  Created by Giorgio Giannotta on 11/03/23.
//

import Foundation

struct ConstructorData: Codable {
    let MRData: MRDConstructorata
}

struct MRDConstructorata: Codable {
    let ConstructorTable: ConstructorTable
}

struct ConstructorTable: Codable {
    let Constructors: [Constructors]
}

struct Constructors: Codable, Identifiable {
    let id = UUID()
    let constructorId: String
    let name: String
    let url: String
    let nationality: String
}
