//
//  WaypointViewController.swift
//  CampusMapping
//
//  Created by Andy Connor on 22/03/2022.
//

import UIKit

class WaypointViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Waypoint"
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}

extension WaypointViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row was tapped!")
    }
}

extension WaypointViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Computer Science Building"
        return cell
    }
}
