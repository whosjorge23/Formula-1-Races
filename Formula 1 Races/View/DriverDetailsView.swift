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
                    Text("\(driver.permanentNumber)")
                        .font(.largeTitle)
                    Text("\(driver.givenName) \(driver.familyName)")
                        .font(.largeTitle)
                    Text("\(driver.code)")
                        .font(.largeTitle)
                    Text("\(driver.nationality) \(viewModel.driverNationalityFlag(nationality: driver.nationality))")
                        .font(.largeTitle)
                    Text("\(driver.dateOfBirth)")
                        .font(.largeTitle)
                }
                
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
        DriverDetailsView(selectedDriver: "leclerc")
    }
}
