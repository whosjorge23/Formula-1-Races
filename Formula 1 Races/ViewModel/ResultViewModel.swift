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
    
    func fetchRacesResult() {
        api.fetchData(url: "https://ergast.com/api/f1/2023/results.json", model: ResultData.self) { result in
            DispatchQueue.main.async {
                self.races = result.MRData.RaceTable.Races
                print("Races fetched: \(self.races.count)")
            }
        } failure: { error in
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                self.fetchRacesResult()
            }
        }
    }
    
}
