//
//  ViewController.swift
//  MapView
//
//  Created by Dufour Sviatoslav on 02/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var typeMapBtn: UISegmentedControl!
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupManager()
        setupMapDelegate()
    }
    
    @IBAction func actionTypeMap(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        case 2:
            mapView.mapType = .hybrid
        case 3:
            mapView.mapType = .hybridFlyover
        default:
            return
        }
    }
}

