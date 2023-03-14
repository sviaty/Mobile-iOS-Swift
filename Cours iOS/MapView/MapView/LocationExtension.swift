//
//  LocationExtension.swift
//  MapView
//
//  Created by Dufour Sviatoslav on 02/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import MapKit
import CoreLocation

extension ViewController: CLLocationManagerDelegate {
    
    
    func setupManager() {
        manager.delegate = self
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
        case .denied:
            print("denied")
        case .notDetermined:
            print("notDetermined")
        case .restricted:
            print("restricted")
        default:
            print("other")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let first = locations.first {
            let coordinates = first.coordinate
            print(coordinates)
            
            let coordinates974 = CLLocationCoordinate2D(latitude: -20.88032, longitude: 55.44642)
            //let center = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
            let delta = 0.5
            let span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
            let region = MKCoordinateRegion(center: coordinates974, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
}
