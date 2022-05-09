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
    
    var buildingSelected: Int?

    let waypoints = BuildingDataLoader().waypointData
    
    // Mock data to initialise the variable
    private var targetNode = MapNode(latitude: 52.416278, longitude: -4.065484, title: "Computer Science Building", subtitle: "Department of Computer Science", label: "Comp Sci")
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var mapState: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Map"
        waypointSelection()
        
        // Sets a coordinate region with the targetNode as the centre and a 500m span.
        let regionSpan: CLLocationDistance = 500
        let coordinateRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 52.41610, longitude: -4.06454),
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
        
    }
    
    func waypointSelection() {
        targetNode.coordinate.latitude = waypoints[buildingSelected!].latitude
        targetNode.coordinate.longitude = waypoints[buildingSelected!].longitude
        targetNode.title = waypoints[buildingSelected!].title
        targetNode.subtitle = waypoints[buildingSelected!].subtitle
        targetNode.label = waypoints[buildingSelected!].label
        mapView.addAnnotation(targetNode)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Allows index of targetNode to be passed to BuildingViewController
        if segue.identifier == "regionPushView" {
            if let destVC = segue.destination as? RoomTableViewController {
                destVC.buildingSelected = buildingSelected!
            }
        }
    }
    

    func locationManager(_ manager: CLLocationManager,  didUpdateLocations locations: [CLLocation]) {
        let location = CLLocation(latitude: targetNode.coordinate.latitude, longitude: targetNode.coordinate.longitude)
        let distance = location.distance(from: manager.location!)
        let formatDistance = String(format: "%.01f", distance) // Format number to a floating point with 1 decimal of precision
        mapState.text = "Distance to \(targetNode.label!) is \(formatDistance)m"
        
        if distance < 50 {
            self.performSegue(withIdentifier: "regionPushView", sender: self)
        }
    }
    
}

