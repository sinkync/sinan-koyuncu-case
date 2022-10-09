//
//  PlacesNavigator.swift
//  sinan-koyuncu-case
//
//  Created by Sinan Koyuncu on 5.10.2022.
//

import Foundation
import UIKit

class PlacesNavigator: BaseNavigator {
    
    func openMap(_ place: Place) {
        let vc = MapVC()
        vc.place = place
        push(vc)
    }
    
    func openFavorites() {
        let vc = FavoritesVC()
        let nc = UINavigationController(rootViewController: vc)
        present(nc)
    }
}
