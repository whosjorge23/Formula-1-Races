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
                    Label("Race List", systemImage: "flag.checkered.2.crossed")
            }

            CircuitMapView()
                .tabItem {
                    Label("Circuits Map", systemImage: "map")
            }
            ConstructorsView()
                .tabItem {
                    Label("Constructors Info", systemImage: "car")
            }
            CreditsView()
                .tabItem {
                    Label("Credits", systemImage: "person")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
