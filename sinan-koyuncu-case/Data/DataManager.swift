//
//  DataManager.swift
//  sinan-koyuncu-case
//
//  Created by Sinan Koyuncu on 6.10.2022.
//

import Foundation

class DataManager {
    
    static let shared: DataManager = DataManager()
    
    var favorites: [Place] = []
    
    func addToFavorites(_ place: Place) {
        favorites.append(place)
    }
    
    func removeFromFavorites(_ place: Place) {
        for (index, favorite) in favorites.enumerated() {
            if favorite.name == place.name {
                favorites.remove(at: index)
            }
        }
    }
    
    func isFavorite(_ place: Place) -> Bool {
        for favorite in favorites {
            if favorite.name == place.name {
                return true
            }
        }
        
        return false
    }
}
