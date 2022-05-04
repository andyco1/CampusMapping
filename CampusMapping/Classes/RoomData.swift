//
//  BuildingData.swift
//  CampusMapping
//
//  Created by Andy Connor on 28/04/2022.
//

import Foundation

public struct RoomData: Codable {
    // Made the struct and variables public so that it can be accessed by testing methods
    public var teachingRooms: [String]
    public var roomDescription: [String]
    public var imageSource: [String]
}
