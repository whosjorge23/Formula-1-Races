//
//  ResultListView.swift
//  Formula 1 Races
//
//  Created by Giorgio Giannotta on 26/03/23.
//

import SwiftUI

struct ResultListView: View {
    @StateObject var vmResult = ResultViewModel()

    var body: some View {
        NavigationView {
            if vmResult.races.isEmpty {
                Text("No results found")
            } else {
                List(vmResult.races, id: \.round) { race in
                    NavigationLink(destination: ResultDetailView(results: race.Results)) {
                        Text(race.raceName)
                    }
                    
                }
                .navigationTitle("Races Result")
            }
                
        }
        .preferredColorScheme(.dark)
    }
}

struct ResultListView_Previews: PreviewProvider {
    static var previews: some View {
        ResultListView()
    }
}
