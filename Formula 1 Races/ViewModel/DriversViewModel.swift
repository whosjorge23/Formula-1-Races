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
    
    func driversPic(driverID: String) -> String {
//        print(driverID)
        switch driverID {
            case "zhou":
                return "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/zhou.jpg.img.1920.medium.jpg/1677069909295.jpg"
            case "bottas":
                return "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/bottas.jpg.img.1920.medium.jpg/1677069810695.jpg"
            case "tsunoda":
                return "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/tsunoda.jpg.img.1920.medium.jpg/1677069846213.jpg"
            case "de_vries":
                return "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/devries.jpg.img.1920.medium.jpg/1676983081637.jpg"
            case "gasly":
                return "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/gasly.jpg.img.1920.medium.jpg/1676983081984.jpg"
            case "ocon":
                return "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/ocon.jpg.img.1920.medium.jpg/1677069269007.jpg"
            case "stroll":
                return "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/stroll.jpg.img.1920.medium.jpg/1677069453013.jpg"
            case "alonso":
                return "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/alonso.jpg.img.1920.medium.jpg/1677244577162.jpg"
            case "leclerc":
                return "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/leclerc.jpg.img.1920.medium.jpg/1677069223130.jpg"
            case "sainz":
                return "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/sainz.jpg.img.1920.medium.jpg/1677069189406.jpg"
            case "kevin_magnussen":
                return "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/magnussen.jpg.img.1920.medium.jpg/1677069387823.jpg"
            case "hulkenberg":
                return "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/hulkenberg.jpg.img.1920.medium.jpg/1676983071882.jpg"
            case "norris":
                return "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/norris.jpg.img.1920.medium.jpg/1677069505471.jpg"
            case "piastri":
                return "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/piastri.jpg.img.1920.medium.jpg/1676983075734.jpg"
            case "hamilton":
                return "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/hamilton.jpg.img.1920.medium.jpg/1677069594164.jpg"
            case "russell":
                return "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/russell.jpg.img.1920.medium.jpg/1677069334466.jpg"
            case "max_verstappen":
                return "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/verstappen.jpg.img.1920.medium.jpg/1677069646195.jpg"
            case "perez":
                return "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/perez.jpg.img.1920.medium.jpg/1677069773437.jpg"
            case "albon":
                return "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/albon.jpg.img.1920.medium.jpg/1677068770293.jpg"
            case "sargeant":
                return "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/sargeant.jpg.img.1920.medium.jpg/1676983079144.jpg"
            default:
                return "Image"
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

