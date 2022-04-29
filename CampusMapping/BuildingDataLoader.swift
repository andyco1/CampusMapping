//
//  BuildingDataLoader.swift
//  CampusMapping
//
//  Created by Andy Connor on 29/04/2022.
//

import Foundation

public class BuildingDataLoader {
    var buildingData = [BuildingData]()
    
    init() {
        load()
    }
    
    func load() {
       if let filePath = Bundle.main.url(forResource: "buildings", withExtension: "json") {
            do {
                let data = try Data(contentsOf: filePath)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([BuildingData].self, from: data)
                
                self.buildingData = dataFromJson
            } catch {
                print(error)
            }
        }
    }
}
