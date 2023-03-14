//
//  MapExtension.swift
//  MapView
//
//  Created by Dufour Sviatoslav on 02/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import MapKit

extension ViewController: MKMapViewDelegate {
    func setupMapDelegate(){
        mapView.delegate = self
        locations.forEach { (position) in
            // Simple Annotation
            /*
            let annotation = MKPointAnnotation()
            annotation.coordinate = maison.coordinate
            annotation.title = maison.title
            annotation.subtitle = maison.subTitle
            */
            
            // Custom Annotation
            let annotation = MapAnnotation(position)
            mapView.addAnnotation(annotation)
        }
        
    }
    
    /*
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        <#code#>
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        <#code#>
    }
    */
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        } else {
            // Marker
            /*
            let newAnnotation = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "ID")
            newAnnotation.markerTintColor = .blue
            return newAnnotation
            */
            
            // Pin
            /*
            let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "ID")
            pin.pinTintColor = .blue
            pin.canShowCallout = true
            return pin
            */
            
            // Custom
            /*
            let custom = MKAnnotationView(annotation: annotation, reuseIdentifier: "ID")
        
            custom.image = UIImage(systemName: "map")
            custom.canShowCallout = true
            return custom
            */
            
            // Custom Deque
            if let anno = annotation as? MapAnnotation {
                let id = "id"
                var view: MKAnnotationView
                if let dequeue = mapView.dequeueReusableAnnotationView(withIdentifier: id) {
                    dequeue.annotation = anno
                    view = dequeue
                } else {
                    view = MKAnnotationView(annotation: anno, reuseIdentifier: id)
                    view.canShowCallout = true
                }
                view.image = UIImage(systemName: "map")
                view.leftCalloutAccessoryView = UIImageView(image: UIImage(systemName: "heart"))
                
                
                let btn = UIButton(type: .infoDark)
                btn.addTarget(self, action: #selector(showBtn), for: .touchUpInside)
                view.rightCalloutAccessoryView = btn
                
                return view
            } else {
                let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "ID")
                pin.pinTintColor = .blue
                pin.canShowCallout = true
                return pin
            }
        }
    }

    @objc func showBtn() {
        print("Touched")
    }
}
