//
//  Mission.swift
//  MoonShot
//
//  Created by Dev on 27/02/2023.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayNmae: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchdate: String{
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}

