//
//  WaypointViewController.swift
//  CampusMapping
//
//  Created by Andy Connor on 22/03/2022.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate {
    
    var rowSelected : Int?
    
    let waypoints = DataLoader().waypointData
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Waypoint"
        
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Pulls number of rows to be displayed from the models array
        return waypoints.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = waypoints[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Performs the segue to MapViewController when the user selects a row
        rowSelected = indexPath.row
        performSegue(withIdentifier: "tableReturn", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Allows index of selected row passed to MapViewController
        if segue.identifier == "tableReturn" {
            if let destVC = segue.destination as? WaypointViewController {
            destVC.rowSelected = rowSelected!
        }
    }
}
    
}
