//
//  ConstructorDetailsView.swift
//  Formula 1 Races
//
//  Created by Giorgio Giannotta on 12/03/23.
//

import SwiftUI

struct ConstructorDetailsView: View {
    @StateObject var viewModel = ConstructorsViewModel()
    var constructor: Constructors
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: viewModel.constructorImageEXTUrl(constructorName: constructor.name))) { image in
                            image.resizable()
                                .transition(.opacity)
                            
                        } placeholder: {
                            Image(systemName: "icloud.slash")
                        }
                        .frame(width: .infinity, height: 200)
//                        .aspectRatio(contentMode: .fit)
            Text("**Car**")
                .font(.title2)
            AsyncImage(url: URL(string: viewModel.constructorImageCarUrl(constructorName: constructor.name))) { image in
                            image.resizable()
                                .transition(.opacity)
                            
                        } placeholder: {
                            Image(systemName: "icloud.slash")
                        }
//                        .frame(width: .infinity, height: 110)
                        .aspectRatio(contentMode: .fit)
            Group {
                Text("**Full Team Name**: \(viewModel.constructorFullName(constructorName: constructor.name))")
                    .font(.title2)
                Text("**Nationality**: \(constructor.nationality) \(viewModel.constructorNationalityFlag(nationality: constructor.nationality))")
                    .font(.title2)
                Text("**Base**: \(viewModel.constructorBase(constructorName: constructor.name))")
                    .font(.title2)

                Text("**Power Unit**: \(viewModel.constructorPowerUnit(constructorName: constructor.name))")
                    .font(.title2)
                Text("**First Team Entry**: \(viewModel.constructorEntry(constructorName: constructor.name))")
                    .font(.title2)
                HStack {
                    Text("**Drivers**:")
                        .font(.title2)
                    
                    NavigationLink(destination: DriverDetailsView(selectedDriver: viewModel.constructorDriversID(constructorName: constructor.name)[0])) {
                        Text("\(viewModel.constructorDrivers(constructorName: constructor.name)[0])")
                            .font(.title2)
                    }
                    NavigationLink(destination: DriverDetailsView(selectedDriver: viewModel.constructorDriversID(constructorName: constructor.name)[1])) {
                        Text("\(viewModel.constructorDrivers(constructorName: constructor.name)[1])")
                            .font(.title2)
                    }
                }
            }
            Spacer()
            .padding()
            .navigationTitle(constructor.name)
            .onAppear{
            }
        }
    }
}

struct ConstructorDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ConstructorDetailsView( constructor: Constructors(constructorId: "ferrari", name: "Ferrari", url: "https://en.wikipedia.org/wiki/Scuderia_Ferrari", nationality: "Italian"))
    }
}
