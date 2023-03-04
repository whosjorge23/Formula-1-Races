//
//  ContentView.swift
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
                VStack(alignment: .leading) {
                    Text("\(race.raceName)")
                        .font(.headline)
                    Text("\(race.date) at \(viewModel.formatTimeInGMT(timeString: race.time))")      .font(.subheadline)
                    Text("\(race.Circuit.circuitName), \(race.Circuit.Location.locality), \(race.Circuit.Location.country)")
                        .font(.subheadline)
                }
            }
            .navigationTitle("🏁F1 Races 2023🏁")
        }
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
