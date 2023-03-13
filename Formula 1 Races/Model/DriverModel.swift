//
//  DriverModel.swift
//  Formula 1 Races
//
//  Created by Giorgio Giannotta on 12/03/23.
//

import Foundation

struct DriverData: Codable {
    let MRData: MRDriverData
}

struct MRDriverData: Codable {
    let DriverTable: DriverTable
}

struct DriverTable: Codable {
    let Drivers: [Drivers]
}

struct Drivers: Codable, Identifiable {
    let id = UUID()
    let driverId: String
    let permanentNumber: String
    let code: String
    let url: String
    let givenName: String
    let familyName: String
    let dateOfBirth: String
    let nationality: String
}
