//
//  CreditsView.swift
//  Formula 1 Races
//
//  Created by Giorgio Giannotta on 11/03/23.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Text("Developer Credits")
                .bold()
                .font(.largeTitle)
            Form {
                Section(header: Text("Application")) {
                    
                    InfoRowView(name: "Developer", content: "Giorgio Giannotta")
                    InfoRowView(name: "Platforms", content: "iOS, Web & Flutter")
                    InfoRowView(name: "Languages", content: "Swift, Python, JS, Dart")
                    InfoRowView(name: "Website", linkLabel: "Softbay X", linkDestination: "softbayx.com")
                    InfoRowView(name: "Portfolio", linkLabel: "westcostyle", linkDestination: "westcostyle.com")
                    InfoRowView(name: "Twitter", linkLabel: "@whosjorge23", linkDestination: "twitter.com/whosjorge23")
                    InfoRowView(name: "GitHub", linkLabel: "@whosjorge23", linkDestination: "github.com/whosjorge23")
                    InfoRowView(name: "Instagram", linkLabel: "@whosjorge23", linkDestination: "instagram.com/whosjorge23")
                }
                
            }
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}

struct InfoRowView: View {
    // MARK: - PROPERTIES
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    // MARK: - BODY
    var body: some View {
        VStack() {
            Divider().padding(.vertical, 4).opacity(0.0)
            HStack{
                Text(name).foregroundColor(.gray)
                Spacer()
                if (content != nil) {
                    Text(content!)
                } else if (linkLabel != nil && linkDestination != nil) {
                    Link(linkLabel! ,destination: URL(string: "https://\(linkDestination!)")!).foregroundColor(.red)
                    Image(systemName: "arrow.up.right.square").foregroundColor(.red)
                }else {
                    EmptyView()
                }
            }//:HSTACK
        }//: VSTACK
    }
}
