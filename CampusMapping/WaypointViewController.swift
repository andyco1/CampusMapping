//
//  WaypointViewController.swift
//  CampusMapping
//
//  Created by Andy Connor on 22/03/2022.
//

import UIKit

class WaypointViewController: UIViewController, UITableViewDelegate {
    
    var rowSelected : Int?
    
    public var models: [String] = [
        "Computer Science Building",
        "Penbryn Reception",
        "Hugh Owen Library",
        "Aberystwyth Arts Centre",
        "Students Union"
    ]
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Waypoint"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}

//extension WaypointViewController: UITableViewDelegate {
//
//
//}

extension WaypointViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
//        cell.textLabel?.text = "Computer Science Building"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowSelected = indexPath.row
        performSegue(withIdentifier: "tableReturn", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tableReturn" {
            if let destVC = segue.destination as? MapViewController {
            print(rowSelected!)
            destVC.rowSelected = rowSelected!
        }
    }
}
    
}
