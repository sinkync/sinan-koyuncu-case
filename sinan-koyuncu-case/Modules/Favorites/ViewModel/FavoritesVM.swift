//
//  FavoritesVM.swift
//  sinan-koyuncu-case
//
//  Created by Sinan Koyuncu on 6.10.2022.
//

import Foundation

class FavoritesVM: BaseVM {
    
    private var navigator: FavoritesNavigator
        
    private var places: [Place]?
    
    var refreshing: (() -> ())?
    
    var numberOfPlaces: Int {
        return places?.count ?? 0
    }
    
    func place(at indexPath: IndexPath) -> Place? {
        return places?[indexPath.row]
    }
    
    init(navigator: FavoritesNavigator) {
        self.navigator = navigator
    }
}

// MARK: - Navigation

extension FavoritesVM {
    
    func showPlaceDetail(_ place: Place) {
        navigator.showPlaceDetail(place)
    }
    
    func close() {
        navigator.dismiss()
    }
}

// MARK: - Data

extension FavoritesVM {
    
    func loadFavorites() {
        places = DataManager.shared.favorites
        refreshing?()
    }
}
