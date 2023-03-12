//
//  ConstructorsView.swift
//  Formula 1 Races
//
//  Created by Giorgio Giannotta on 11/03/23.
//

import SwiftUI

struct ConstructorsView: View {
    @StateObject var viewModel = ConstructorsViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.constructors, id: \.id) { constructor in
                NavigationLink(destination: ConstructorDetailsView(constructor: constructor)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("**\(constructor.name)**")
                                .font(.headline)
                            Text("**Nationality** \(constructor.nationality) \(viewModel.constructorNationalityFlag(nationality: constructor.nationality))")
                                .font(.subheadline)
                            Text("**Power Unit** \(viewModel.constructorPowerUnit(constructorName: constructor.name))")
                                .font(.subheadline)
                            Text("**Drivers** \(viewModel.constructorDrivers(constructorName: constructor.name)[0]) - \(viewModel.constructorDrivers(constructorName: constructor.name)[1])")
                                .font(.subheadline)
                        }
                        Spacer()
                        VStack {
                            AsyncImage(url: URL(string: viewModel.constructorImageUrl(constructorName: constructor.name))) { image in
                                            image.resizable()
                                        } placeholder: {
                                            Image(systemName: "icloud.slash")
                                        }
                                        .frame(width: 60, height: 60)
                        }
                    }
                }
                
            }
            .navigationTitle("Constructors 2023")
        }
        
        .onAppear{
            viewModel.fetchConstructors()
        }
    }
}

struct ConstructorsView_Previews: PreviewProvider {
    static var previews: some View {
        ConstructorsView()
    }
}
