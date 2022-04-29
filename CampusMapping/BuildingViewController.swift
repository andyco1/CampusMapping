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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
