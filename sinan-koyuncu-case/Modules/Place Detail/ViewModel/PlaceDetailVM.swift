//
//  PlaceDetailVM.swift
//  sinan-koyuncu-case
//
//  Created by Sinan Koyuncu on 6.10.2022.
//

import Foundation

class PlaceDetailVM: BaseVM {
    
    private var navigator: PlaceDetailNavigator
    
    var place: Place?
    
    var favoriteStatusChanged: ((Bool) -> ())?
    
    init(navigator: PlaceDetailNavigator) {
        self.navigator = navigator
    }
    
    func toogleFavoriteStatus() {
        guard let place = place else { return }

        let isFavorite = DataManager.shared.isFavorite(place)
        
        if isFavorite {
            DataManager.shared.removeFromFavorites(place)
        } else {
            DataManager.shared.addToFavorites(place)
        }
        
        favoriteStatusChanged?(!isFavorite)
    }
    
    func checkFavoriteStatus() {
        guard let place = place else { return }
        
        let isFavorite = DataManager.shared.isFavorite(place)
        
        favoriteStatusChanged?(isFavorite)
    }
}

// MARK: - Navigation

extension PlaceDetailVM {
    
    func close() {
        navigator.close()
    }
}
