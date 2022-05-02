//
//  RoomTableViewController.swift
//  CampusMapping
//
//  Created by Andy Connor on 01/05/2022.
//

import UIKit

class RoomTableViewController: UITableViewController {
    
    @IBOutlet var roomTableView: UITableView!
    
    var rowSelected : Int?
    
    let rooms = RoomDataLoader().buildingData

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Waypoint"
        
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // Pulls number of rows to be displayed by calling the .count of the teachingRooms within the rows array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms[rowSelected!].teachingRooms.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = rooms[rowSelected!].teachingRooms[indexPath.row]
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // Performs the segue to MapViewController when the user selects a row
//        rowSelected = indexPath.row
//        performSegue(withIdentifier: "tableReturn", sender: self)
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Allows index of selected row passed to WaypointViewController
//        if segue.identifier == "tableReturn" {
//            if let waypointVC = segue.destination as? WaypointViewController {
//            waypointVC.rowSelected = rowSelected!
//            }
//        }
//    }
}

