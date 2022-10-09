//
//  Request.swift
//  sinan-koyuncu-case
//
//  Created by Sinan Koyuncu on 6.10.2022.
//

import Foundation
import Alamofire

enum ServiceType {
    case googlePlaces
}

class Request: NSObject {
    
    var path: String { return "" }
    var method: HTTPMethod { return .get }
    var parameters: [String: String] { return ["": ""] }
    var service: ServiceType { return .googlePlaces }
}


extension Request {
    
    var url: URL {
        switch service {
        case .googlePlaces:
            return URL(string: Config.googlePlacesBaseURL + "/" + path)!
        }
    }
}
