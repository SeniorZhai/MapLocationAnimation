//
//  ViewController.swift
//  MapLocationAnimation
//
//  Created by zhai on 16/9/1.
//  Copyright © 2016年 zhai. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController ,MKMapViewDelegate{
    
    struct Constants {
        struct MapViewIdentifiers {
            static let sonarAnnotationView = "sonarAnnotationView"
        }
    }
    
    @IBOutlet var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 3000
    let latitude = 40.758873
    let longitude = -73.985134

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let initialLocation = CLLocation(latitude: latitude,longitude: longitude)
        centerMapOnLocation(initialLocation)
        
        let annotation = Annotation(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), title: nil, subtitle: nil)
        mapView.addAnnotation(annotation)
        mapView.delegate = self
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(Constants.MapViewIdentifiers.sonarAnnotationView)
        
        if annotationView == nil {
            annotationView = SonarAnnotationView(annotation: annotation, reuseIdentifier: Constants.MapViewIdentifiers.sonarAnnotationView)
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: false)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

