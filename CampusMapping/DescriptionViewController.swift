//
//  DescriptionViewController.swift
//  CampusMapping
//
//  Created by Andy Connor on 02/05/2022.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var rowSelected: Int?
    
    var roomSelected: Int?

    var roomDescriptions = RoomDataLoader().buildingData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = roomDescriptions[rowSelected!].teachingRooms[roomSelected!]
        
        descriptionLabel.text = roomDescriptions[rowSelected!].roomDescription[roomSelected!]
        
        imageView.image = UIImage(named: roomDescriptions[rowSelected!].imageSource[roomSelected!])

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
