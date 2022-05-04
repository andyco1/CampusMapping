//
//  Waypoint.swift
//  CampusMapping
//
//  Created by Andy Connor on 19/04/2022.
//

import Foundation
import MapKit

public struct Building: Codable {
    // Made the struct and variables public so that it can be accessed by testing methods
    public var id: Int
    public var title: String?
    public var subtitle: String?
    public var label: String?
    public var latitude: Double
    public var longitude: Double
    
    public var coordinate: CLLocationCoordinate2D {
        .init(latitude: latitude, longitude: longitude)
    }
}
