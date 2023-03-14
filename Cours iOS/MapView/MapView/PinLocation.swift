//
//  PinLocation.swift
//  MapView
//
//  Created by Dufour Sviatoslav on 02/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import CoreLocation

struct PinLocation {
    var title: String
    var subTitle: String?
    var coordinate: CLLocationCoordinate2D
}

let locations: [PinLocation] = [
    PinLocation(title: "Saint denis", subTitle: nil, coordinate: CLLocationCoordinate2D(latitude: -20.88032, longitude:  55.44642))
]
