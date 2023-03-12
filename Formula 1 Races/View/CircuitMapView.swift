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
            var mapCoordinate = CLLocationCoordinate2D(latitude: 42.6384261, longitude: 12.674297)
            
            var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
            
            var mapRegion = MKCoordinateRegion(center: mapCoordinate, span: mapZoomLevel)
            
            return mapRegion
        }()
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, annotationItems: viewModel.circuitLocation, annotationContent: {
                        item in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: Double(item.Location.lat) ?? 0.0, longitude: Double(item.Location.long) ?? 0.0)) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white.opacity(0.7))
                            .cornerRadius(10)
                            .frame(width: 120, height: 70)
                            .shadow(radius: 5)
                            .overlay {
                                VStack {
                                    Text("🏁")
                                        .font(.title)
                                    Text(item.circuitName)
                                        .foregroundColor(.blue)
                                        .font(.caption2)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(nil)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                
                            }
                        
                    
                    }
                }
                        
            })
            .ignoresSafeArea(.all, edges: .all)
    //        .cornerRadius(10)
            .onAppear {
                viewModel.fetchCircuitLocation()
            }
//            VStack {
//                Rectangle()
//                    .foregroundColor(.white.opacity(0.7))
//                    .cornerRadius(10)
//                    .frame(width: .infinity, height: 60)
//                    .shadow(radius: 5)
//                    .overlay {
//                        Text("Circuits Map")
//                            .font(.largeTitle)
//                            .foregroundColor(.blue)
//                    }
//                Spacer()
//            }
            
        }
    }
}

struct CircuitMapView_Previews: PreviewProvider {
    static var previews: some View {
        CircuitMapView()
    }
}
