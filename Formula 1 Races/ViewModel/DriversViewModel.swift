//
//  DriversViewModel.swift
//  Formula 1 Races
//
//  Created by Giorgio Giannotta on 12/03/23.
//

import SwiftUI

class DriversViewModel: ObservableObject {
    @Published var drivers = [Drivers]()
    @Published var driver = [Drivers]()
    
    private let api = APIManager()
    
    //    func runOnMain(_ method: @escaping () -> Void) {
    //        DispatchQueue.main.async {
    //            withAnimation {
    //                method()
    //            }
    //        }
    //    }
    
    func fetchDrivers() {
        api.fetchData(url: "https://ergast.com/api/f1/2023/drivers.json", model: DriverData.self) { result in
            DispatchQueue.main.async {
                self.drivers = result.MRData.DriverTable.Drivers
            }
        } failure: { error in
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                self.fetchDrivers()
            }
        }
    }
    func fetchDriver(driverID: String) {
        api.fetchData(url: "https://ergast.com/api/f1/drivers/\(driverID).json", model: DriverData.self) { result in
            DispatchQueue.main.async {
                self.driver = result.MRData.DriverTable.Drivers
            }
        } failure: { error in
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                self.fetchDriver(driverID: driverID)
            }
        }
    }
    
    
    func driverNationalityFlag(nationality: String) -> String {
//        print(nationality)
        switch nationality {
            case "Thai":
                return "🇹🇭"
            case "Spanish":
                return "🇪🇸"
            case "British":
                return "🇬🇧"
            case "French":
                return "🇫🇷"
            case "German":
                return "🇩🇪"
            case "American":
                return "🇺🇸"
            case "Finnish":
                return "🇫🇮"
            case "Dutch":
                return "🇳🇱"
            case "Monegasque":
                return "🇲🇨"
            case "Danish":
                return "🇩🇰"
            case "Mexican":
                return "🇲🇽"
            case "Australian":
                return "🇦🇺"
            case "Canadian":
                return "🇨🇦"
            case "Japanese":
                return "🇯🇵"
            case "Chinese":
                return "🇨🇳"
            default:
                return "Country"
        }
    }
    
}

