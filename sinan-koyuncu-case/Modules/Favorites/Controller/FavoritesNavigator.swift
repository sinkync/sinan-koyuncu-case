//
//  FavoritesNavigator.swift
//  sinan-koyuncu-case
//
//  Created by Sinan Koyuncu on 6.10.2022.
//

import UIKit

class FavoritesNavigator: BaseNavigator {
    
    func showPlaceDetail(_ place: Place) {
        let vc = PlaceDetailVC()
        vc.place = place
        let nc = UINavigationController(rootViewController: vc)
        present(nc)
    }
    
    func close() {
        dismiss()
    }
}
