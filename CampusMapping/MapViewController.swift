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
//
//    let CSDept = MapNode(latitude: 52.416278, longitude: -4.065484, title: "Computer Science Building",
//                         subtitle: "Department of Computer Science")
    
    var targetNode = MapNode(latitude: 52.416278, longitude: -4.065484, title: "Computer Science Building",
                             subtitle: "Department of Computer Science")
    
    var rowSelected: Int?

    var label = "Comp Sci"
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var mapState: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Map"
        updateSelection()
        // Sets a coordinate region with the Computer Science building as the centre and a 500m span.
        let regionSpan: CLLocationDistance = 500
        let coordinateRegion = MKCoordinateRegion(
//             center: CSDept.coordinate,
            center: targetNode.coordinate,
             latitudinalMeters: regionSpan,
             longitudinalMeters: regionSpan)
       mapView.setRegion(coordinateRegion, animated: true)
//       mapView.addAnnotation(CSDept)
        mapView.addAnnotation(targetNode)
        
        // Asks for user location permission. 10m accuracy and shows the users location.
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true

        mapState.text = "State: Unknown"
        
    }
    
    
    func updateSelection() {
        switch rowSelected {
        case 0:
            targetNode.coordinate.latitude = 52.416278
            targetNode.coordinate.longitude = -4.065484
            targetNode.title = "Computer Science Building"
            targetNode.subtitle = "Department of Computer Science Building"
            label = "Comp Sci"
        case 1:
            targetNode.coordinate.latitude = 52.41779
            targetNode.coordinate.longitude = -4.06526
            targetNode.title = "Penbryn Reception"
            targetNode.subtitle = "Aberystwyth University Reception Building"
            label = "Reception"
        case 2:
            targetNode.coordinate.latitude = 52.41612
            targetNode.coordinate.longitude = -4.06365
            targetNode.title = "Hugh Owen Library"
            targetNode.subtitle = "Aberystwyth University Library Building"
            label = "Library"
        default:
            print("Error in switch statement!")
        }
    }
    
    func locationManager(_ manager: CLLocationManager,  didUpdateLocations locations: [CLLocation]) {
        // Do something with the location.
//        let csLocation = CLLocation(latitude: CSDept.coordinate.latitude, longitude: CSDept.coordinate.longitude)
//        let distance = csLocation.distance(from: manager.location!)
        let location = CLLocation(latitude: targetNode.coordinate.latitude, longitude: targetNode.coordinate.longitude)
        let distance = location.distance(from: manager.location!)
        let formatDistance = String(format: "%.01f", distance) // Format number to a floating point with 1 decimal of precision
        mapState.text = "Distance to \(label) is \(formatDistance)m"
    }
}


class MapNode: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(latitude: CLLocationDegrees, longitude: CLLocationDegrees, title: String, subtitle: String) {
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.title = title
        self.subtitle = subtitle
    }
}

