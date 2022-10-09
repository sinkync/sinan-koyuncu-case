//
//  PlacesViewModel.swift
//  sinan-koyuncu-case
//
//  Created by Sinan Koyuncu on 5.10.2022.
//

import Foundation
import CoreLocation

class PlacesVM: BaseVM {
    
    private var navigator: PlacesNavigator
    private let client = Client<SearchPlaceResponse>()
    private let locationManager = CLLocationManager()
        
    private var places: [Place]?
    private var currentLocation: CLLocation?
    
    var refreshing: (() -> ())?
    
    var numberOfPlaces: Int {
        return places?.count ?? 0
    }
    
    func place(at indexPath: IndexPath) -> Place? {
        return places?[indexPath.row]
    }
    
    init(navigator: PlacesNavigator) {
        self.navigator = navigator
    }
}

// MARK: - Navigation

extension PlacesVM {
    
    func openMap(_ place: Place) {
        navigator.openMap(place)
    }
    
    func openFavorites() {
        navigator.openFavorites()
    }
}

// MARK: - Networking

extension PlacesVM {
    
    func searchPlaces(_ query: String) {
        guard let location = currentLocation, query.count >= 3 else { return }
        
        client.request(SearchPlaceRequest(query: query, location: location)) { response in
            switch response {
            case .success(let result):
                self.places = result.results
                self.refreshing?()
            case .failure(_):
                // Handle error
                break
            }
        }
    }
}

// MARK: - Location

extension PlacesVM: CLLocationManagerDelegate {
    
    func requestLocation() {
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations.first
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Handle error
    }
}
