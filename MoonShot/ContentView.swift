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
    let astronauts = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        Text("\(astronauts.count)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
