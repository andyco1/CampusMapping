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

    let waypoints = WaypointDataLoader().waypointData
    
    private var targetNode = MapNode(latitude: 52.416278, longitude: -4.065484, title: "Computer Science Building",
                                     subtitle: "Department of Computer Science", label: "Comp Sci")
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var mapState: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Map"
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
        
//        let geoFenceRegion:CLCircularRegion = CLCircularRegion(center: targetNode.coordinate, radius: 100, identifier: targetNode.label!) // Creates Geo-fence region around targetNode selected by user. CoreLocation has limitations on its minumum radius distance. From testing it appears the minumum is 200m no matter what value is set in this function.

//        locationManager.startMonitoring(for: geoFenceRegion)
    }
    
    func waypointSelection() {
        targetNode.coordinate.latitude = waypoints[rowSelected!].latitude
        targetNode.coordinate.longitude = waypoints[rowSelected!].longitude
        targetNode.title = waypoints[rowSelected!].title
        targetNode.subtitle = waypoints[rowSelected!].subtitle
        targetNode.label = waypoints[rowSelected!].label
        mapView.addAnnotation(targetNode)
    }
    
//    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
//        if (state == .inside) {
//            print("User inside the radius of \(targetNode.label!)")
//            self.performSegue(withIdentifier: "regionPushView", sender: self)
//        } else {
//            print("User outside target region")
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Allows index of targetNode to be passed to BuildingViewController
        if segue.identifier == "regionPushView" {
            if let destVC = segue.destination as? BuildingViewController {
                destVC.rowSelected = rowSelected!
            }
        }
    }
    

    func locationManager(_ manager: CLLocationManager,  didUpdateLocations locations: [CLLocation]) {
        let location = CLLocation(latitude: targetNode.coordinate.latitude, longitude: targetNode.coordinate.longitude)
        let distance = location.distance(from: manager.location!)
        let formatDistance = String(format: "%.01f", distance) // Format number to a floating point with 1 decimal of precision
        mapState.text = "Distance to \(targetNode.label!) is \(formatDistance)m"
        
        if distance < 50 {
            print("User inside the radius of \(targetNode.label!)")
            self.performSegue(withIdentifier: "regionPushView", sender: self)
        }
    }
    
}

