//
//  MapAnnotation.swift
//  MapView
//
//  Created by Dufour Sviatoslav on 02/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import MapKit
import CoreLocation

class MapAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var location: PinLocation
    var title: String?
    var subtitle: String?
    
    init(_ location: PinLocation) {
        self.location = location
        self.coordinate = location.coordinate
        self.title = location.title
        self.subtitle = location.subTitle
    }
}
