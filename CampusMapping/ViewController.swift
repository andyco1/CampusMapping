//
//  ViewController.swift
//  CampusMapping
//
//  Created by Andy Connor on 11/03/2022.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let CSDept = MapNode(latitude: 52.415904, longitude: -4.0650508, title: "Computer Science Building", subtitle: "Department of Computer Science")
        // Sets a coordinate region with the Computer Science building as the centre and a 250m span.
        let regionSpan: CLLocationDistance = 250
        let coordinateRegion = MKCoordinateRegion(
             center: CSDept.coordinate,
             latitudinalMeters: regionSpan,
             longitudinalMeters: regionSpan)
       mapView.setRegion(coordinateRegion, animated: true)
       mapView.addAnnotation(CSDept)
        // Asks for user location permission. 10m accuracy and shows the users location.
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }

}

class MapNode: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    
    init(latitude: CLLocationDegrees, longitude: CLLocationDegrees, title: String, subtitle: String) {
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.title = title
        self.subtitle = subtitle
    }
}

