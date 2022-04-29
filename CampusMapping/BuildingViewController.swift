//
//  BuildingViewController.swift
//  CampusMapping
//
//  Created by Andy Connor on 28/04/2022.
//

import UIKit

class BuildingViewController: UIViewController {
    
    var rowSelected: Int?
    
    let buildings = BuildingDataLoader().buildingData
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Building ViewController Pushed")
        titleLabel.text = buildings[rowSelected!].title
        

        // Do any additional setup after loading the view.
    }
}
