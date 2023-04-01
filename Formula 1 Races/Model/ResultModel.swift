//
//  ResultModel.swift
//  Formula 1 Races
//
//  Created by Giorgio Giannotta on 25/03/23.
//

import Foundation

struct ResultData: Codable {
    let MRData: MRResultData
}

struct MRResultData: Codable {
    let RaceTable: ResultRaceTable
}

struct ResultRaceTable: Codable {
    let season: String
    let Races: [RaceResult]
}

struct RaceResult: Codable {
    let season: String
    let round: String
    let url: String
    let raceName: String
    let Circuit: CircuitResult
    let date: String
    let time: String
    let Results: [Result]
}

struct CircuitResult: Codable, Identifiable {
    let id = UUID()
    let circuitId: String
    let url: String
    let circuitName: String
    let Location: LocationResult
}

struct LocationResult: Codable {
    let lat: String
    let long: String
    let locality: String
    let country: String
}

struct Result: Codable, Identifiable {
    let id = UUID()
    let number: String
    let position: String
    let positionText: String
    let points: String
    let Driver: DriverResult
    let Constructor: ConstructorResult
    let grid: String
    let laps: String
    let status: String
    let Time: TimeResult?
    let FastestLap: FastestLap?
    let AverageSpeed: AverageSpeed?
}

struct DriverResult: Codable, Identifiable {
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

struct ConstructorResult: Codable, Identifiable {
    let id = UUID()
    let constructorId: String
    let name: String
    let url: String
    let nationality: String
}

struct TimeResult: Codable {
    let millis: String
    let time: String
}

struct FastestLap: Codable {
    let rank: String
    let lap: String
    let Time: TimeFastestLap
}

struct TimeFastestLap: Codable {
    let time: String
}

struct AverageSpeed: Codable {
    let units: String
    let speed: String
}
