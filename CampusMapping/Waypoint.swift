//
//  Waypoint.swift
//  CampusMapping
//
//  Created by Andy Connor on 19/04/2022.
//

import Foundation
import MapKit

struct Waypoint: Codable {
    // NSObject, Decodable, Identifiable, MKAnnotation
    var id: Int
    var title: String?
    var subtitle: String?
    var label: String?
    var latitude: Double
    var longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        .init(latitude: latitude, longitude: longitude)
    }
    
//    init(id: Int, title: String?, subtitle: String?, label: String?, latitude: Double, longitude: Double) {
//        self.id = id
//        self.title = title
//        self.subtitle = subtitle
//        self.label = label
//        self.latitude = latitude
//        self.longitude = longitude
//    }
}
