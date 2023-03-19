//
//  CircuitDetailsView.swift
//  Formula 1 Races
//
//  Created by Giorgio Giannotta on 19/03/23.
//

import SwiftUI
import _MapKit_SwiftUI

struct CircuitDetailsView: View {
    @StateObject var viewModel = RaceListViewModel()
    let circuit: Circuit
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: viewModel.circuitPic(circuitName: circuit.circuitName))) { image in
                    image.resizable()
                        .transition(.opacity)
                    
                } placeholder: {
                    Image(systemName: "icloud.slash")
                }
                .aspectRatio(contentMode: .fit)
                
                
                Text("**Circuit**: \(circuit.circuitName)")
                    .font(.title3)
                Text("**Location**: \(circuit.Location.locality), \(circuit.Location.country)\(viewModel.countryFlag(country: circuit.Location.country))")
                    .font(.title3)
                Spacer()
                Map(coordinateRegion: $viewModel.region, annotationItems: [$viewModel.annotation]) { annotation in
                    MapAnnotation(coordinate: viewModel.annotation.coordinate) {
                        ZStack {
                            Circle()
                                .foregroundColor(.blue.opacity(0.50))
                                .frame(width: 100, height: 100)
                            Text("🏁")
                                .font(.largeTitle)
                        }
                    }
                }
                .frame(height: 300)
                .cornerRadius(10)
            }
            .padding()
            .onAppear{
                viewModel.setRegionLocation(for: circuit)
            }
        }
    }
}

struct CircuitDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CircuitDetailsView(circuit: Circuit(circuitId: "miami", url: "url", circuitName: "Miami International Autodrome", Location: Location(lat: "25.9581", long: "-80.2389", locality: "Miami", country: "USA")))
    }
}
