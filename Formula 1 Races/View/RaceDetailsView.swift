//
//  RaceDetailsView.swift
//  Formula 1 Races
//
//  Created by Giorgio Giannotta on 04/03/23.
//

import SwiftUI
import MapKit

struct RaceDetailsView: View {
    @StateObject var viewModel = RaceListViewModel()
    var race: Race
        
        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Text(race.raceName)
                        .font(.largeTitle)
                }
                Map(coordinateRegion: $viewModel.region)
                    .frame(height: 300)
                    .cornerRadius(10)
                HStack {
                    Text("**Date**: \(viewModel.formatDate(dateString: race.date))")
                        .font(.title2)
                    Spacer()
                    Text("**Time**: \(viewModel.formatTimeInGMT(timeString: race.time))")
                        .font(.title2)
                }
                
                Text("**Circuit**: \(race.Circuit.circuitName)")
                    .font(.title3)
                Text("**Location**: \(race.Circuit.Location.locality), \(race.Circuit.Location.country)\(viewModel.countryFlag(country: race.Circuit.Location.country))")
                    .font(.title3)
                Group{
                    VStack {
                        HStack {
                            Text("**First Practice**")
                                .font(.title3)
                            Spacer()
                        }
                        HStack {
                            Text("**Date**: \(viewModel.formatDate(dateString: race.FirstPractice?.date ?? "N/A"))")
                                .font(.title3)
                            Spacer()
                            Text("**Time**: \(viewModel.formatTimeInGMT(timeString: race.FirstPractice?.time ?? "N/A"))")
                                .font(.title3)
                        }
                        
                    }
                    VStack {
                        HStack {
                            Text("**Second Practice**:")
                                .font(.title3)
                            Spacer()
                        }
                        HStack {
                            Text("**Date**: \(viewModel.formatDate(dateString: race.SecondPractice?.date ?? "N/A"))")
                                .font(.title3)
                            Spacer()
                            Text("**Time**: \(viewModel.formatTimeInGMT(timeString: race.SecondPractice?.time ?? "N/A"))")
                                .font(.title3)
                        }
                    }
                    VStack {
                        HStack {
                            Text("**Third Practice**:")
                                .font(.title3)
                            Spacer()
                        }
                        HStack {
                            Text("**Date**: \(viewModel.formatDate(dateString: race.ThirdPractice?.date ?? "N/A"))")
                                .font(.title3)
                            Spacer()
                            Text("**Time**: \(viewModel.formatTimeInGMT(timeString: race.ThirdPractice?.time ?? "N/A"))")
                                .font(.title3)
                        }
                    }
                    VStack {
                        HStack {
                            Text("**Qualifying**:")
                                .font(.title3)
                            Spacer()
                        }
                        HStack {
                            Text("**Date**: \(viewModel.formatDate(dateString: race.Qualifying?.date ?? "N/A"))")
                                .font(.title3)
                            Spacer()
                            Text("**Time**: \(viewModel.formatTimeInGMT(timeString: race.Qualifying?.time ?? "N/A"))")
                                .font(.title3)
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Race Details")
            .onAppear{
                viewModel.setRegion(for: race)
            }
        }
}

struct RaceDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RaceDetailsView( race: Race(season: "2023", round: "1", url: "fdfdf", raceName: "Bahrain Grand Prix", Circuit: Circuit(circuitId: "bahrain", url: "dfdfdf", circuitName: "Bahrain International Circuit", Location: Location(lat: "26.0325", long: "50.5106", locality: "Sakhir", country: "Bahrain")), date: "2023-03-05", time: "5:00:00Z", FirstPractice: FirstPractice(date: "2023-03-03", time: "11:30:00Z"), SecondPractice: SecondPractice(date: "2023-03-03", time: "15:00:00Z"), ThirdPractice: ThirdPractice(date: "2023-03-04", time: "11:30:00Z"), Qualifying: Qualifying(date: "2023-03-04", time: "15:00:00Z")))
    }
}
