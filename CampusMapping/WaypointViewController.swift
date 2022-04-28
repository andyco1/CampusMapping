//
//  ViewController.swift
//  CampusMapping
//
//  Created by Andy Connor on 11/03/2022.
//

import UIKit
import MapKit
import CoreLocation

class WaypointViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    
    var rowSelected: Int?

//    var label = "Comp Sci" // Default waypoint label

    let waypoints = DataLoader().waypointData
    
    private var targetNode = MapNode(latitude: 52.416278, longitude: -4.065484, title: "Computer Science Building",
                                     subtitle: "Department of Computer Science", label: "Comp Sci")
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var mapState: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Map"
        self.view.bringSubviewToFront(mapState)
//        let data = DataLoader().waypointData
//        print(data)
//        updateSelection()
        waypointSelection()
        
        // Sets a coordinate region with the targetNode as the centre and a 500m span.
        let regionSpan: CLLocationDistance = 500
        let coordinateRegion = MKCoordinateRegion(
            center: targetNode.coordinate,
            latitudinalMeters: regionSpan,
            longitudinalMeters: regionSpan)
        mapView.setRegion(coordinateRegion, animated: true)
        
        
        // Asks for user location permission. 10m accuracy and shows the users location.
//        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true

        mapState.text = "State: Unknown"
        
        let geoFenceRegion:CLCircularRegion = CLCircularRegion(center: targetNode.coordinate, radius: 100, identifier: targetNode.label!)

        locationManager.startMonitoring(for: geoFenceRegion)
    }
    
    func waypointSelection() {
        targetNode.coordinate.latitude = waypoints[rowSelected!].latitude
        targetNode.coordinate.longitude = waypoints[rowSelected!].longitude
        targetNode.title = waypoints[rowSelected!].title
        targetNode.subtitle = waypoints[rowSelected!].subtitle
        targetNode.label = waypoints[rowSelected!].label
        mapView.addAnnotation(targetNode)
    }
    
    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        if (state == .inside) {
            print("User inside the radius of \(targetNode.label!)")
        } else {
            print("User outside target region")
        }
    }
    
//    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
//        print("Entered \(region.identifier)")
//    }
//    
//    
//    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
//        print("Exited \(region.identifier)")
//    }

    func locationManager(_ manager: CLLocationManager,  didUpdateLocations locations: [CLLocation]) {
        let location = CLLocation(latitude: targetNode.coordinate.latitude, longitude: targetNode.coordinate.longitude)
        let distance = location.distance(from: manager.location!)
        let formatDistance = String(format: "%.01f", distance) // Format number to a floating point with 1 decimal of precision
        mapState.text = "Distance to \(targetNode.label!) is \(formatDistance)m"
    }
    
    
}

//private class MapNode: NSObject, MKAnnotation {
//    var coordinate: CLLocationCoordinate2D
//    var title: String?
//    var subtitle: String?
//
//    init(latitude: CLLocationDegrees, longitude: CLLocationDegrees, title: String, subtitle: String) {
//        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//        self.title = title
//        self.subtitle = subtitle
//
//    func updateSelection() { // Function to pull index of row selected on WaypointViewController and set the targetNode with data.
//        switch rowSelected {
//        case 0:
//            targetNode.coordinate.latitude = 52.416278
//            targetNode.coordinate.longitude = -4.065484
//            targetNode.title = "Computer Science Building"
//            targetNode.subtitle = "Department of Computer Science Building"
//            label = "Comp Sci"
//        case 1:
//            targetNode.coordinate.latitude = 52.41779
//            targetNode.coordinate.longitude = -4.06526
//            targetNode.title = "Penbryn Reception"
//            targetNode.subtitle = "Aberystwyth University Reception Building"
//            label = "Reception"
//        case 2:
//            targetNode.coordinate.latitude = 52.41612
//            targetNode.coordinate.longitude = -4.06365
//            targetNode.title = "Hugh Owen Library"
//            targetNode.subtitle = "Aberystwyth University Library Building"
//            label = "Library"
//        case 3:
//            targetNode.coordinate.latitude = 52.41585
//            targetNode.coordinate.longitude = -4.06278
//            targetNode.title = "Aberystwyth Arts Centre"
//            targetNode.subtitle = "Aberyswtyth Arts Centre Building"
//            label = "Arts Centre"
//        case 4:
//            targetNode.coordinate.latitude = 52.41518
//            targetNode.coordinate.longitude = -4.06313
//            targetNode.title = "Students Union"
//            targetNode.subtitle = "Aberyswtyth University Students Union"
//            label = "Students Union"
//        default:
//            print("Error in switch statement!")
//        }
//    }
//    }
//}

