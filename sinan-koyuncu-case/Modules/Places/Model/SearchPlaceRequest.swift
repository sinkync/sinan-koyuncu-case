//
//  PlacesRequest.swift
//  sinan-koyuncu-case
//
//  Created by Sinan Koyuncu on 6.10.2022.
//

import Foundation
import CoreLocation

class SearchPlaceRequest: Request {
    
    private var query: String
    private var location: CLLocation
    
    init(query: String, location: CLLocation) {
        self.query = query
        self.location = location
    }
    
    override var path: String {
        return "nearbysearch/json"
    }
    
    override var parameters: [String : String] {
        let latitue = location.coordinate.latitude.toString()
        let longitude = location.coordinate.longitude.toString()
        
        return [
            "keyword": query,
            "inputtype": "textquery",
            "location": "\(latitue),\(longitude)",
            "radius": "5000",
            "key": Config.googleMapsApiKey
        ]
    }
}
