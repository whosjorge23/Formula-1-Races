//
//  DriverDetailsView.swift
//  Formula 1 Races
//
//  Created by Giorgio Giannotta on 12/03/23.
//

import SwiftUI

struct DriverDetailsView: View {
    @StateObject var viewModel = DriversViewModel()
        var selectedDriver: String
        
        var body: some View {
            if let driver = viewModel.driver.first {
                VStack {
                    AsyncImage(url: URL(string: viewModel.driversPic(driverID: selectedDriver))) { image in
                                    image.resizable()
                                        .transition(.opacity)
                                    
                                } placeholder: {
                                    Image(systemName: "icloud.slash")
                                }
                                .frame(width: .infinity, height: 360)
                                .overlay {
                                    VStack{
                                        Spacer()
                                        Rectangle()
                                            .frame(width: .infinity,height: 140)
                                            .foregroundColor(Color.black.opacity(0.8))
                                            .overlay {
                                                VStack{
                                                    Text("**\(driver.permanentNumber) \(viewModel.driverNationalityFlag(nationality: driver.nationality))**")
                                                        .font(.title)
                                                    Text("**Name**: \(driver.givenName) \(driver.familyName) \(driver.code)")
                                                        .font(.title2)
                                                    Text("**Nationality**: \(driver.nationality) \(viewModel.driverNationalityFlag(nationality: driver.nationality))")
                                                        .font(.title2)
                                                    Text("**Date of birth**: \(driver.dateOfBirth)")
                                                        .font(.title2)
                                                }
                                            }
                                        
                                    }
                                }
                    //TODO: Add Driver Helmet
                    AsyncImage(url: URL(string: viewModel.driversHelmetPic(driverID: selectedDriver))) { image in
                                    image.resizable()
                                        .transition(.opacity)
                                    
                                } placeholder: {
                                    Image(systemName: "icloud.slash")
                                }
//                                .frame(width: 380, height: 260)
                                .aspectRatio(contentMode: .fit)
                    //TODO: Add Driver BirthPlace
                    Spacer()
                }
                .preferredColorScheme(.dark)
                .onAppear {
                    viewModel.fetchDriver(driverID: selectedDriver)
                }
            } else {
                Text("Loading...")
                    .onAppear {
                        viewModel.fetchDriver(driverID: selectedDriver)
                    }
            }
        }
}

struct DriverDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DriverDetailsView(selectedDriver: "tsunoda")
    }
}
