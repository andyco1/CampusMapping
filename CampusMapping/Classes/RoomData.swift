//
//  BuildingData.swift
//  CampusMapping
//
//  Created by Andy Connor on 28/04/2022.
//

import Foundation

struct RoomData: Codable {
    // Made the struct and variables public so that it can be accessed by testing methods
    var teachingRooms: [String]
    var roomDescription: [String]
    var imageSource: [String]
}
