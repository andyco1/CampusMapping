//
//  BuildingDataLoader.swift
//  CampusMapping
//
//  Created by Andy Connor on 29/04/2022.
//

import Foundation

public class RoomDataLoader {
    var roomData = [RoomData]()
    
    init() {
        load()
    }
    
    func load() {
       if let filePath = Bundle.main.url(forResource: "buildingData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: filePath)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([RoomData].self, from: data)
                
                self.roomData = dataFromJson
            } catch {
                print(error)
            }
        }
    }
}
