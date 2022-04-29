//
//  BuildingData.swift
//  CampusMapping
//
//  Created by Andy Connor on 28/04/2022.
//

import Foundation

struct BuildingData: Codable {
    var id: Int
    var title: String?
    var teachingRooms: [String]
    var roomDescription: [String]

}
