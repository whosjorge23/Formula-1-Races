//
//  FormulaOneViewModel.swift
//  Formula 1 Races
//
//  Created by Giorgio Giannotta on 04/03/23.
//

import Foundation

class RaceListViewModel: ObservableObject {
    @Published var races = [Race]()
    
    func fetchRaces() {
        let url = URL(string: "https://ergast.com/api/f1/2023.json")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let raceData = try JSONDecoder().decode(RaceData.self, from: data)
                DispatchQueue.main.async {
                    self.races = raceData.MRData.RaceTable.Races
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    // Define a helper function to format the time in GMT timezone
    func formatTimeInGMT(timeString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.timeZone = TimeZone(identifier: "UTC")
        
        if let date = formatter.date(from: timeString) {
            formatter.timeZone = TimeZone(secondsFromGMT: 1)
            return formatter.string(from: date)
        } else {
            return timeString
        }
    }

}
