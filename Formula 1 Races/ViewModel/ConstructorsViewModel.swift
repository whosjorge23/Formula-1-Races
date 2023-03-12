//
//  ConstructorsViewModel.swift
//  Formula 1 Races
//
//  Created by Giorgio Giannotta on 11/03/23.
//

import Foundation

import SwiftUI
import MapKit

class ConstructorsViewModel: ObservableObject {
    @Published var constructors = [Constructors]()
    
    private let api = APIManager()
    
//    func runOnMain(_ method: @escaping () -> Void) {
//        DispatchQueue.main.async {
//            withAnimation {
//                method()
//            }
//        }
//    }
    
    func fetchConstructors() {
        api.fetchData(url: "https://ergast.com/api/f1/2023/constructors.json", model: ConstructorData.self) { result in
            DispatchQueue.main.async {
                self.constructors = result.MRData.ConstructorTable.Constructors
            }
        } failure: { error in
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                self.fetchConstructors()
            }
        }
    }
    
    func constructorNationalityFlag(nationality: String) -> String {
//        print(nationality)
        switch nationality {
            case "Swiss":
                return "🇨🇭"
            case "British":
                return "🇬🇧"
            case "French":
                return "🇫🇷"
            case "German":
                return "🇩🇪"
            case "American":
                return "🇺🇸"
            case "Italian":
                return "🇮🇹"
            case "Austrian":
                return "🇦🇹"
            default:
                return "Country"
        }
    }
    
    func constructorImageUrl(constructor: String) -> String {
//        print(constructor)
        switch constructor {
            case "Alfa Romeo":
                return "https://media.formula1.com/content/dam/fom-website/teams/2023/alfa-romeo-logo.png.transform/2col-retina/image.png"
            case "AlphaTauri":
                return "https://media.formula1.com/content/dam/fom-website/teams/2023/alphatauri-logo.png.transform/2col-retina/image.png"
            case "Alpine F1 Team":
                return "https://media.formula1.com/content/dam/fom-website/teams/2023/alpine-logo.png.transform/2col-retina/image.png"
            case "Aston Martin":
                return "https://media.formula1.com/content/dam/fom-website/teams/2023/aston-martin-logo.png.transform/2col-retina/image.png"
            case "Ferrari":
                return "https://media.formula1.com/content/dam/fom-website/teams/2023/ferrari-logo.png.transform/2col-retina/image.png"
            case "Haas F1 Team":
                return "https://media.formula1.com/content/dam/fom-website/teams/2023/haas-f1-team-logo.png.transform/2col-retina/image.png"
            case "McLaren":
                return "https://media.formula1.com/content/dam/fom-website/teams/2023/mclaren-logo.png.transform/2col-retina/image.png"
            case "Mercedes":
                return "https://media.formula1.com/content/dam/fom-website/teams/2023/mercedes-logo.png.transform/2col-retina/image.png"
            case "Red Bull":
                return "https://media.formula1.com/content/dam/fom-website/teams/2023/red-bull-racing-logo.png.transform/2col-retina/image.png"
            case "Williams":
                return "https://media.formula1.com/content/dam/fom-website/teams/2023/williams-logo.png.transform/2col-retina/image.png"
            default:
                return "Country"
        }
    }
    
    func constructorPowerUnit(powerUnit: String) -> String {
//        print(powerUnit)
        switch powerUnit {
            case "Alfa Romeo":
                return "Ferrari"
            case "AlphaTauri":
                return "Honda RBPT"
            case "Alpine F1 Team":
                return "Renault"
            case "Aston Martin":
                return "Mercedes"
            case "Ferrari":
                return "Ferrari"
            case "Haas F1 Team":
                return "Ferrari"
            case "McLaren":
                return "Mercedes"
            case "Mercedes":
                return "Mercedes"
            case "Red Bull":
                return "Honda RBPT"
            case "Williams":
                return "Mercedes"
            default:
                return "Country"
        }
    }
    
    func constructorDrivers(drivers: String) -> [String] {
//        print(powerUnit)
        switch drivers {
            case "Alfa Romeo":
                return ["Zhou Guanyu", "Valtteri Bottas"]
            case "AlphaTauri":
                return ["Yuki Tsunoda", "Nyck De Vries"]
            case "Alpine F1 Team":
                return ["Pierre Gasly", "Esteban Ocon"]
            case "Aston Martin":
                return ["Lance Stroll", "Fernando Alonso"]
            case "Ferrari":
                return ["Charles Leclerc", "Carlos Sainz"]
            case "Haas F1 Team":
                return ["Kevin Magnussen", "Nico Hulkenberg"]
            case "McLaren":
                return ["Lando Norris", "Oscar Piastri"]
            case "Mercedes":
                return ["Lewis Hamilton", "George Russell"]
            case "Red Bull":
                return ["Max Verstappen", "Sergio Perez"]
            case "Williams":
                return ["Alexander Albon", "Logan Sargeant"]
            default:
                return ["Driver 1", "Driver 2"]
        }
    }
}
