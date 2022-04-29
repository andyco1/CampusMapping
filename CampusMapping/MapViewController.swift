//
//  MapViewController.swift
//  CampusMapping
//
//  Created by Andy Connor on 10/04/2022.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    var startNode = MapNode(latitude: 52.416278, longitude: -4.065484, title: "Computer Science Building", subtitle: "Department of Computer Science", label: "Comp Sci")
    
    var multipleAnnotations: [MKAnnotation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let regionSpan: CLLocationDistance = 500
        let coordinateRegion = MKCoordinateRegion(
            center: startNode.coordinate,
            latitudinalMeters: regionSpan,
            longitudinalMeters: regionSpan)
        mapView.setRegion(coordinateRegion, animated: true)
        let waypoints = WaypointDataLoader().waypointData
        
        
        for waypoint in waypoints {
            let annotation = MKPointAnnotation()
            
            annotation.title = waypoint.title
            annotation.subtitle = waypoint.subtitle
            annotation.coordinate = waypoint.coordinate
            
            multipleAnnotations.append(annotation)
                        
            mapView.addAnnotations(multipleAnnotations)
            
        }
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }

}

public class MapNode: NSObject, MKAnnotation {
    public var coordinate: CLLocationCoordinate2D
    public var title: String?
    public var subtitle: String?
    public var label: String?

    init(latitude: CLLocationDegrees, longitude: CLLocationDegrees, title: String, subtitle: String, label: String) {
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.title = title
        self.subtitle = subtitle
        self.label = label
    }
}
        
        
