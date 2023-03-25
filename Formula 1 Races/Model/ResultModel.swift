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
    let Circuit: Circuit
    let date: String
    let time: String
    let Results: [Result]
}

struct Result: Codable {
    let number: String
    let position: String
    let positionText: String
    let points: String
    let Driver: Drivers
    let Constructor: Constructors
    let grid: String
    let laps: String
    let status: String
    let Time: TimeResult
    let FastestLap: FastestLap
    let AverageSpeed: AverageSpeed
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
