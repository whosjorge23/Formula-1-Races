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
            List(vmResult.races, id: \.round) { race in
                NavigationLink(destination: CreditsView()) {
                Text(race.raceName)
                }
            }
//            .navigationTitle("Races 2023")
            .onAppear {
                vmResult.fetchRacesResult()
            }
        }
}

struct ResultListView_Previews: PreviewProvider {
    static var previews: some View {
        ResultListView()
    }
}
