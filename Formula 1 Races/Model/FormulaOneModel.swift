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
}

struct Circuit: Codable {
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
