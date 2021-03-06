//
//  DataLoader.swift
//  CampusMapping
//
//  Created by Andy Connor on 24/04/2022.
//

import Foundation

class BuildingDataLoader {
    // Made the class and relevant methods public so that it can be accessed by testing methods
    
    var waypointData = [Building]()
    
    init() {
        load()
        sort()
    }
    
    func load() {
        if let filePath = Bundle.main.url(forResource: "buildingData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: filePath)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Building].self, from: data)
                
                self.waypointData = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
    func sort() {
        self.waypointData = self.waypointData.sorted(by: { $0.id < $1.id }) // Sort waypoint data by ID in ascending order to allow selected row to be called by functions
        
    }
}
