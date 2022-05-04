//
//  CampusMappingTests.swift
//  CampusMappingTests
//
//  Created by Andy Connor on 04/05/2022.
//

import XCTest
import CampusMapping

class CampusMappingTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testJSONDecoding() throws {
        // Load arrays of data with DataLoader classes
        let buildingData = BuildingDataLoader().waypointData
        let roomData = RoomDataLoader().roomData
        
        // Check that the buildingJSON file that the application uses exists
        guard let url = Bundle.main.url(forResource: "buildingData", withExtension: "json") else {
            XCTFail("Missing JSON file: buildingData.json")
            return
        }
        
        // Check first element of buildingData which was decoded from the JSON holds the expected data
        XCTAssertEqual(buildingData[0].id, 0)
        XCTAssertEqual(buildingData[0].title, "Cledwyn Building")
        XCTAssertEqual(buildingData[0].subtitle, "Aberystwyth University Cledwyn Building")
        XCTAssertEqual(buildingData[0].label, "Cledwyn")
        XCTAssertEqual(buildingData[0].latitude, 52.41710)
        XCTAssertEqual(buildingData[0].longitude, -4.06732)
        
        
        // Check first element of roomData which was decoded from the JSON holds the expected data
        XCTAssertEqual(roomData[0].teachingRooms[0], "0.21")
        XCTAssertEqual(roomData[0].roomDescription[0], "0.21 is located on the ground floor of Cledwyn building")
        XCTAssertEqual(roomData[0].imageSource[0], "0.21")
    }

}
