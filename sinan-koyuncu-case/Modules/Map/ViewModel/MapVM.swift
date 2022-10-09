//
//  MapVM.swift
//  sinan-koyuncu-case
//
//  Created by Sinan Koyuncu on 6.10.2022.
//

import Foundation

class MapVM: BaseVM {
    
    private var navigator: MapNavigator
    
    init(navigator: MapNavigator) {
        self.navigator = navigator
    }
    
}

// MARK: - Navigation

extension MapVM {
    
    func showPlaceDetail(_ place: Place) {
        navigator.showPlaceDetail(place)
    }
}
