//
//  MapVC.swift
//  sinan-koyuncu-case
//
//  Created by Sinan Koyuncu on 5.10.2022.
//

import UIKit
import GoogleMaps

class MapVC: BaseVC {
    
    private var viewModel: MapVM!
    
    var place: Place?
    
    // MARK: - Components
    
    private var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigator = MapNavigator(navigationController: navigationController)
        viewModel = MapVM(navigator: navigator)
        setupMap()
    }
}

// MARK: - UI

private extension MapVC {
    
    func setupMap() {
        guard let place = place, let location = place.geometry?.location else { return }
        
        let camera = GMSCameraPosition.camera(withLatitude: location.latitude, longitude: location.longitue, zoom: 18.0)
        mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        mapView.delegate = self
        view.addSubview(mapView)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitue)
        marker.map = mapView
    }
}

// MARK: - GMSMapViewDelegate

extension MapVC: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        if let place = place {
            viewModel.showPlaceDetail(place)
        }
        
        return true
    }
}
