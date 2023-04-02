//
//  RaceListView.swift
//  Formula 1 Races
//
//  Created by Giorgio Giannotta on 04/03/23.
//

import SwiftUI

struct RaceListView: View {
    @StateObject var viewModel = RaceListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.races, id: \.round) { race in
                NavigationLink(destination: RaceDetailsView(race: race)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("**\(race.raceName)**")
                                .font(.headline)
                            Text("**Race** \(viewModel.formatDate(dateString: race.date)) at \(viewModel.formatTimeInGMT(timeString: race.time))")
                                .font(.subheadline)
                            Text("**Circuit** \(race.Circuit.circuitName)\n**Place** \(race.Circuit.Location.locality), \(race.Circuit.Location.country) \(viewModel.countryFlag(country: race.Circuit.Location.country))")
                                .font(.subheadline)
                        }
                        Spacer()
                        VStack {
                            Text("**Round**")
                            
                            Text("\(race.round)")
                                .font(.largeTitle)
                        }
                    }
                }
                
            }
            .navigationTitle("Races")
        }
//        .environmentObject(viewModel)
        .onAppear {
            viewModel.fetchRaces()
        }
    }
}

struct RaceListView_Previews: PreviewProvider {
    static var previews: some View {
        RaceListView()
    }
}
