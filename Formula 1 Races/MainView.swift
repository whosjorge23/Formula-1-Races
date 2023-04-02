//
//  MainView.swift
//  Formula 1 Races
//
//  Created by Giorgio Giannotta on 11/03/23.
//

import SwiftUI

struct MainView: View {
    @State var index = 0
    var body: some View {
//        TabView {
//            RaceListView()
//                .tabItem {
////                    Label("Race", systemImage: "flag.checkered.2.crossed")
//                    Label("Races", image: "races")
//            }
//
//            CircuitMapView()
//                .tabItem {
////                    Label("Circuits Map", systemImage: "map")
//                    Label("Circuits", image: "map")
//            }
//            ResultListView()
//                .tabItem {
////                    Label("Results", systemImage: "trophy")
//                    Label("Results", image: "result")
//            }
//            ConstructorsView()
//                .tabItem {
////                    Label("Constructors", systemImage: "car")
//                    Label("Constructors", image: "constructor")
//            }
//            CreditsView()
//                .tabItem {
////                    Label("Credits", systemImage: "person")
//                    Label("Credits", image: "credit")
//            }
//        }
//        .accentColor(.red)
        VStack(alignment: .center, spacing: 0, content: {
            
            ZStack{
                if self.index == 0 {
                    RaceListView()
                }
                else if self.index == 1 {
                    
                    CircuitMapView()
                }
                else if self.index == 2 {
                    
                    ResultListView()
                }
                else if self.index == 3 {
                    
                    ConstructorsView()
                }
                else {
                    CreditsView()
                }
            }
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            CircleTabBarView(index: self.$index)
        })
        .edgesIgnoringSafeArea(.top)
        .preferredColorScheme(.dark)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
