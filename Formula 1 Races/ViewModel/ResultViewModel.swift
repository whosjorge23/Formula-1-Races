//
//  ResultViewModel.swift
//  Formula 1 Races
//
//  Created by Giorgio Giannotta on 25/03/23.
//

import SwiftUI

class ResultViewModel: ObservableObject {
    @Published var races = [RaceResult]()
    
    private let api = APIManager()
    
    init() {
        fetchRacesResult()
    }
    
    func fetchRacesResult() {
        api.fetchData(url: "https://ergast.com/api/f1/2023/results.json", model: ResultData.self) { result in
            DispatchQueue.main.async {
                self.races = result.MRData.RaceTable.Races
//                print("Races fetched: \(self.races.count)")
            }
        } failure: { error in
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                self.fetchRacesResult()
            }
        }
    }
    
    func driversHelmetPic(driverID: String) -> String {
//        print(driverID)
        switch driverID {
            case "zhou":
                return "https://media.formula1.com/content/dam/fom-website/manual/Helmets2023/zhou.png"
            case "bottas":
                return "https://media.formula1.com/content/dam/fom-website/manual/Helmets2023/bottas.png"
            case "tsunoda":
                return "https://media.formula1.com/content/dam/fom-website/manual/Helmets2023/tsunoda.png"
            case "de_vries":
                return "https://media.formula1.com/content/dam/fom-website/manual/Helmets2023/devries.png"
            case "gasly":
                return "https://media.formula1.com/content/dam/fom-website/manual/Helmets2023/gasly.png"
            case "ocon":
                return "https://media.formula1.com/content/dam/fom-website/manual/Helmets2023/ocon.png"
            case "stroll":
                return "https://media.formula1.com/content/dam/fom-website/manual/Helmets2023/stroll.png"
            case "alonso":
                return "https://media.formula1.com/content/dam/fom-website/manual/Helmets2022/alonso.png"
            case "leclerc":
                return "https://media.formula1.com/content/dam/fom-website/manual/Helmets2023/leclerc.png"
            case "sainz":
                return "https://media.formula1.com/content/dam/fom-website/manual/Helmets2023/sainz.png"
            case "kevin_magnussen":
                return "https://media.formula1.com/content/dam/fom-website/manual/Helmets2023/magnussen.png"
            case "hulkenberg":
                return "https://media.formula1.com/content/dam/fom-website/manual/Helmets2023/hulkenberg.png"
            case "norris":
                return "https://media.formula1.com/content/dam/fom-website/manual/Helmets2023/norris.png"
            case "piastri":
                return "https://media.formula1.com/content/dam/fom-website/manual/Helmets2023/piastri.png"
            case "hamilton":
                return "https://media.formula1.com/content/dam/fom-website/manual/Helmets2023/hamilton.png"
            case "russell":
                return "https://media.formula1.com/content/dam/fom-website/manual/Helmets2023/russell.png"
            case "max_verstappen":
                return "https://media.formula1.com/content/dam/fom-website/manual/Helmets2023/verstappen.png"
            case "perez":
                return "https://media.formula1.com/content/dam/fom-website/manual/Helmets2023/perez.png"
            case "albon":
                return "https://media.formula1.com/content/dam/fom-website/manual/Helmets2023/albon.png"
            case "sargeant":
                return "https://media.formula1.com/content/dam/fom-website/manual/Helmets2023/sargeant.png"
            default:
                return "Image"
        }
    }
    
}
