//
//  Waypoint.swift
//  CampusMapping
//
//  Created by Andy Connor on 19/04/2022.
//

import Foundation
import MapKit

struct Building: Codable {
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
}
