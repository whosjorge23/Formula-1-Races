//
//  MainView.swift
//  Formula 1 Races
//
//  Created by Giorgio Giannotta on 11/03/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            RaceListView()
                .tabItem {
                    Label("Race List", systemImage: "list.dash")
            }

            CircuitMapView()
                .tabItem {
                    Label("Circuits Map", systemImage: "map")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
