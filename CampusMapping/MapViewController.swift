//
//  ViewController.swift
//  CampusMapping
//
//  Created by Andy Connor on 11/03/2022.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()

    let CSDept = MapNode(latitude: 52.416278, longitude: -4.065484, title: "Computer Science Building",
                         subtitle: "Department of Computer Science")
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var mapState: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Map"
        // Sets a coordinate region with the Computer Science building as the centre and a 500m span.
        let regionSpan: CLLocationDistance = 500
        let coordinateRegion = MKCoordinateRegion(
             center: CSDept.coordinate,
             latitudinalMeters: regionSpan,
             longitudinalMeters: regionSpan)
       mapView.setRegion(coordinateRegion, animated: true)
       mapView.addAnnotation(CSDept)
        
        // Asks for user location permission. 10m accuracy and shows the users location.
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true

        mapState.text = "State: Unknown"
    }
    
    func locationManager(_ manager: CLLocationManager,  didUpdateLocations locations: [CLLocation]) {
        // Do something with the location.
        let csLocation = CLLocation(latitude: CSDept.coordinate.latitude, longitude: CSDept.coordinate.longitude)
        let distance = csLocation.distance(from: manager.location!)
        let formatDistance = String(format: "%.01f", distance) // Format number to a floating point with 1 decimal of precision
        mapState.text = "Distance to Computer Science is \(formatDistance)m"
    }
}

class MapNode: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    var title: String?
    let subtitle: String?
    
    init(latitude: CLLocationDegrees, longitude: CLLocationDegrees, title: String, subtitle: String) {
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.title = title
        self.subtitle = subtitle
    }
}

