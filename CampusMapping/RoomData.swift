//
//  BuildingData.swift
//  CampusMapping
//
//  Created by Andy Connor on 28/04/2022.
//

import Foundation

struct RoomData: Codable {
    var id: Int
    var title: String?
    var teachingRooms: [String]
    var roomDescription: [String]

//    init(id: Int, title: String?, teachingRooms: [String], roomDescription: [String]) {
//        self.id = -1
//        self.title = "placeholder"
//        self.teachingRooms = []
//        self.roomDescription = []
//    }
}
