//
//  FormulaOneViewModel.swift
//  Formula 1 Races
//
//  Created by Giorgio Giannotta on 04/03/23.
//

import SwiftUI
import MapKit

class RaceListViewModel: ObservableObject {
    @Published var races = [Race]()
    @Published var selectedRace: Race?
    @Published var region = MKCoordinateRegion()
    @Published var annotation = MKPointAnnotation()
    
    private let api = APIManager()
    
    func runOnMain(_ method: @escaping () -> Void) {
        DispatchQueue.main.async {
            withAnimation {
                method()
            }
        }
    }
    
    func fetchRaces() {
//        let url = URL(string: "https://ergast.com/api/f1/2023.json")!
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print(error.localizedDescription)
//                return
//            }
//
//            guard let data = data else {
//                print("No data received")
//                return
//            }
//
//            do {
//                let raceData = try JSONDecoder().decode(RaceData.self, from: data)
//                DispatchQueue.main.async {
//                    self.races = raceData.MRData.RaceTable.Races
//                    print("Race: \(raceData)")
//                }
//            } catch {
//                print("Error: \(error.localizedDescription)")
//            }
//        }.resume()
        api.fetchData(url: "https://ergast.com/api/f1/2023.json", model: RaceData.self) { result in
            self.runOnMain {
                self.races = result.MRData.RaceTable.Races
            }
        } failure: { error in
            self.runOnMain {
                print("IP: \(error.localizedDescription)")
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    print("Trying again to fetch IP...")
                    self.fetchRaces()
                }
            }
        }
    }
    
    // Define a helper function to format the time in GMT timezone
    func formatTimeInGMT(timeString: String) -> String {
//        let hour = timeString.dropLast(7)
//        let minute = timeString.dropFirst(3).dropLast(4)
//        let formattedTimeString = timeString.dropLast(4)
//        print("\(hour):\(minute)") // prints "15:00"
//        let localTimeZone = TimeZone.current
//        print(localTimeZone.identifier) // prints the identifier of the local time zone
//        return String("\((Int(hour) ?? 0) + 1):\(minute)")
        let time = timeString.dropLast(1)
        let gmtTimeString = time
        var timeToString = "N/A"

        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        formatter.timeZone = TimeZone(identifier: "GMT")

        if let gmtDate = formatter.date(from: String(gmtTimeString)) {
            formatter.timeZone = TimeZone.current
            let localTimeString = formatter.string(from: gmtDate)
            timeToString = localTimeString
//            print(localTimeString)
        } else {
//            print("Invalid GMT time string")
        }
        let raceTime = timeToString.dropLast(3)
        if raceTime == "" {
            return "🤷‍♂️🤷‍♂️"
        }else {
            return String(raceTime)
        }
    }
    
    // Define a helper function to format the date
    func formatDate(dateString: String) -> String {
        let day = dateString.dropFirst(8)
        let month = dateString.dropFirst(5).dropLast(3)
        let year = dateString.dropLast(6)
//        print(day)
//        print(month)
//        print(year)
//        print(dateString)
        if month == "" && day == "" && year == "" {
            return "🤷‍♂️🤷‍♂️"
        }else {
            return "\(month)/\(day)/\(year)"
        }
        
    }
    
    func countryFlag(country: String) -> String {
//        print(country)
        switch country {
            case "Bahrain":
                return "🇧🇭"
            case "UK":
                return "🇬🇧"
            case "Saudi Arabia":
                return "🇸🇦"
            case "Australia":
                return "🇦🇺"
            case "Azerbaijan":
                return "🇦🇿"
            case "USA":
                return "🇺🇸"
            case "United States":
                return "🇺🇸"
            case "Italy":
                return "🇮🇹"
            case "Monaco":
                return "🇲🇨"
            case "Spain":
                return "🇪🇸"
            case "Canada":
                return "🇨🇦"
            case "Austria":
                return "🇦🇹"
            case "Hungary":
                return "🇭🇺"
            case "Belgium":
                return "🇧🇪"
            case "Netherlands":
                return "🇳🇱"
            case "Singapore":
                return "🇸🇬"
            case "Japan":
                return "🇯🇵"
            case "Qatar":
                return "🇶🇦"
            case "Mexico":
                return "🇲🇽"
            case "Brazil":
                return "🇧🇷"
            case "UAE":
                return "🇦🇪"
            default:
                return "Country"
        }
    }
    
    func setRegion(for race: Race) {
        let latitude = race.Circuit.Location.lat
        let longitude = race.Circuit.Location.long
        let center = CLLocationCoordinate2D(latitude: Double(latitude) ?? 0.0, longitude: Double(longitude) ?? 0.0)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        region = MKCoordinateRegion(center: center, span: span)
        annotation.coordinate = CLLocationCoordinate2D(latitude: Double(latitude) ?? 0.0, longitude: Double(longitude) ?? 0.0)
    }
}

extension MKPointAnnotation: Identifiable {
    public var id: String {
        return "\(coordinate.latitude), \(coordinate.longitude)"
    }
}
