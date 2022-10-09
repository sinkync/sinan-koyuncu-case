//
//  Place.swift
//  sinan-koyuncu-case
//
//  Created by Sinan Koyuncu on 5.10.2022.
//

import Foundation

struct Place: Codable {
    let name: String?
    let vicinity: String?
    let geometry: PlaceGeometry?
    let rating: Double?
}

struct PlaceGeometry: Codable {
    let location: PlaceLocation?
}

struct PlaceLocation: Codable {
    let latitude: Double
    let longitue: Double
    
    internal enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitue = "lng"
    }
}
