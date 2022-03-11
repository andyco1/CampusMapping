//
//  ViewController.swift
//  CampusMapping
//
//  Created by Andy Connor on 11/03/2022.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let aberCSBuilding = MapNode(latitude: 52.416250, longitude: -4.065534, title: "Computer Science Building", subtitle: "Computer Science Building on the Aberystwyth University Campus")
        // Sets a coordinate region with the Computer Science building as the centre and a 250m span.
        let regionSpan: CLLocationDistance = 250
        let coordinateRegion = MKCoordinateRegion(
             center: aberCSBuilding.coordinate,
             latitudinalMeters: regionSpan,
             longitudinalMeters: regionSpan)
       mapView.setRegion(coordinateRegion, animated: true)
       mapView.addAnnotation(aberCSBuilding)
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

