//
//  Circular.swift
//  Formula 1 Races
//
//  Created by Giorgio Giannotta on 01/04/23.
//

import SwiftUI

struct CircleTabBarView: View {
    
//    @State var index = 0
    @Binding var index : Int
    
    var body: some View {
        HStack(alignment: .center, spacing: nil, content: {
            Button(action: {
                self.index = 0
            }, label: {
                VStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    if self.index != 0 {
                        Image("races")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 43)
                    }else {
                        Image("races")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 43)
                            .padding()
                            .background(Color.white.opacity(0.20))
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        Text("Races")
                            .foregroundColor(.red)
                    }
                })
                
            })
            Spacer(minLength: 15)
            Button(action: {
                self.index = 1
            }, label: {
                VStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    if self.index != 1 {
                        Image("map")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 43, height: 43)
                    }else {
                        Image("map")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 43, height: 43)
                            .padding()
                            .background(Color.white.opacity(0.20))
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        Text("Circuits")
                            .foregroundColor(.red)
                    }
                })
            })
            Spacer(minLength: 15)
            Button(action: {
                self.index = 2
            }, label: {
                VStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    if self.index != 2 {
                        Image("result")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 43)
                    }else {
                        Image("result")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 43)
                            .padding()
                            .background(Color.white.opacity(0.20))
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        Text("Results")
                            .foregroundColor(.red)
                    }
                })
            })
            Spacer(minLength: 15)
            Button(action: {
                self.index = 3
            }, label: {
                VStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    if self.index != 3 {
                        Image("constructor")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 43)
                    }else {
                        Image("constructor")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 43)
                            .padding()
                            .background(Color.white.opacity(0.20))
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        Text("Constructors")
                            .foregroundColor(.red)
                    }
                })
            })
            Spacer(minLength: 15)
            Button(action: {
                self.index = 4
            }, label: {
                VStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    if self.index != 4 {
                        Image("credit")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 43)
                    }else {
                        Image("credit")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 43)
                            .padding()
                            .background(Color.white.opacity(0.20))
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        Text("Credits")
                            .foregroundColor(.red)
                    }
                })
            })
        })
        .padding(.vertical, -10)
        .padding(.horizontal,20)
        .animation(.spring())
    }
}

//struct CircleTabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        CircleTabBarView()
//    }
//}
