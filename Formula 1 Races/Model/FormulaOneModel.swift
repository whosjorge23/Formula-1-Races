import Foundation

struct RaceData: Codable {
    let MRData: MRData
}

struct MRData: Codable {
    let RaceTable: RaceTable
}

struct RaceTable: Codable {
    let Races: [Race]
}

struct Race: Codable {
    let season: String
    let round: String
    let url: String
    let raceName: String
    let Circuit: Circuit
    let date: String
    let time: String
    let FirstPractice: FirstPractice?
    let SecondPractice: SecondPractice?
    let ThirdPractice: ThirdPractice?
    let Qualifying: Qualifying?
}

struct Circuit: Codable, Identifiable {
    let id = UUID()
    let circuitId: String
    let url: String
    let circuitName: String
    let Location: Location
}

struct Location: Codable {
    let lat: String
    let long: String
    let locality: String
    let country: String
}

struct FirstPractice: Codable {
    let date: String
    let time: String
}

struct SecondPractice: Codable {
    let date: String
    let time: String
}

struct ThirdPractice: Codable {
    let date: String
    let time: String
}

struct Qualifying: Codable {
    let date: String
    let time: String
}
