//
//  DataLoader.swift
//  CampusMapping
//
//  Created by Andy Connor on 24/04/2022.
//

import Foundation

public class DataLoader {
    
    @Published var waypointData = [Waypoint]()
    
    init() {
        load()
        sort()
    }
    
    func load() {
        if let filePath = Bundle.main.url(forResource: "locations", withExtension: "json") {
            do {
                let data = try Data(contentsOf: filePath)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Waypoint].self, from: data)
                
                self.waypointData = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
    func sort() {
        self.waypointData = self.waypointData.sorted(by: { $0.id < $1.id }) // Sort data by ID in ascending order
    }
}
