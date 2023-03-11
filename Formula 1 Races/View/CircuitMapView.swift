//
//  CircuitMapView.swift
//  Formula 1 Races
//
//  Created by Giorgio Giannotta on 11/03/23.
//

import SwiftUI
import MapKit

struct CircuitMapView: View {
    @StateObject var viewModel = RaceListViewModel()
    @State private var region : MKCoordinateRegion = {
            var mapCoordinate = CLLocationCoordinate2D(latitude: 37.6000, longitude: -95.6650)
            
            var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
            
            var mapRegion = MKCoordinateRegion(center: mapCoordinate, span: mapZoomLevel)
            
            return mapRegion
        }()
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: viewModel.circuitLocation, annotationContent: {
                    item in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: Double(item.Location.lat) ?? 0.0, longitude: Double(item.Location.long) ?? 0.0)) {
                ZStack {
                Rectangle()
                        .foregroundColor(.white.opacity(0.7))
                    .cornerRadius(10)
                    .frame(width: 120, height: 60)
                    .shadow(radius: 5)
                VStack {
                    Text("🏁")
                        .font(.title)
                    Text(item.circuitName)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                }
            }
            }
                    
        })
        .ignoresSafeArea(.all, edges: .all)
//        .cornerRadius(10)
        .onAppear {
            viewModel.fetchCircuitLocation()
        }
    }
}

struct CircuitMapView_Previews: PreviewProvider {
    static var previews: some View {
        CircuitMapView()
    }
}
