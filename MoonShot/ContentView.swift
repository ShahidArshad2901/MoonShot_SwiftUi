//
//  ContentView.swift
//  MoonShot
//
//  Created by Dev on 27/02/2023.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street:String
    let city: String
}

struct ContentView: View {
    let astronauts: [String: Astronauts] = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationView{
            ScrollView {
                LazyVGrid(columns: columns){
                    ForEach(missions) { mission in
                        NavigationLink {
                            Text("Detail View")
                        } label : {
                            VStack{
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                      .padding(5)
                                    .frame(width: 100, height: 100)
                                VStack{
                                    Text(mission.displayNmae)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(mission.formattedLaunchdate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground))
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
