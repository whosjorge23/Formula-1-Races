//
//  ResultDetailView.swift
//  Formula 1 Races
//
//  Created by Giorgio Giannotta on 01/04/23.
//

import SwiftUI

struct ResultDetailView: View {
    @StateObject var viewModel = ResultViewModel()
    var results: [Result]
    var body: some View {
        List(results, id: \.id) { result in
            
            HStack{
                VStack {
                    Text(result.position)
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.orange)
//                    Text(result.Driver.code)
//                        .font(.title)
                    AsyncImage(url: URL(string: viewModel.driversHelmetPic(driverID: result.Driver.driverId))) { image in
                        image.resizable()
                            .transition(.opacity)
                        
                    } placeholder: {
                        Image(systemName: "icloud.slash")
                    }
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50)
                }
                HStack{
                    VStack(alignment: HorizontalAlignment.leading) {
                        Text("\(result.Driver.givenName) \(result.Driver.familyName) \(result.Constructor.name)")
                            .bold()
//                        Spacer()
                        Text("Pts: \(result.points) Laps: \(result.laps) Status: \(result.status)")
                            .bold()
//                        Spacer()
                        Text("Time: \(result.Time?.time ?? "No Time") Fastest Lap: \(result.FastestLap?.rank ?? "NA") Average Speed: \(result.AverageSpeed?.speed ?? "")\(result.AverageSpeed?.units ?? "NA")")
                            .bold()
                    }
                   
                }
            }
            
//            VStack {
//                HStack {
//                    VStack {
//                        Text(result.position)
//                        Text(result.Driver.code)
//                    }
//                    HStack {
//                        VStack(alignment: HorizontalAlignment.leading, content: {
//                            Text("\(result.Driver.givenName) \(result.Driver.familyName)")
//                            Text(result.Constructor.name)
//                        })
//                    }
//                    Spacer()
//                    HStack {
//                        VStack(alignment: HorizontalAlignment.trailing, content: {
//                            Text("Points: \(result.points)")
//                            Text("Status: \(result.status)")
//                        })
//                    }
//
//                }
//                Text(result.laps)
//            }
        }
    }
}

struct ResultDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ResultDetailView( results: [Result(number: "1", position: "1", positionText: "1", points: "25", Driver: DriverResult(driverId: "max_verstappen", permanentNumber: "33", code: "VER", url: "url", givenName: "Max", familyName: "Verstappen", dateOfBirth: "1997-09-30", nationality: "Dutch"), Constructor: ConstructorResult(constructorId: "red_bull", name: "Red Bull", url: "url", nationality: "Austrian"), grid: "1", laps: "57", status: "Finished", Time: TimeResult(millis: "5636736", time: "1:33:56.736"), FastestLap: FastestLap(rank: "6", lap: "44", Time: TimeFastestLap(time: "1:36.236")), AverageSpeed: AverageSpeed(units: "kph", speed: "202.452"))])
    }
}
