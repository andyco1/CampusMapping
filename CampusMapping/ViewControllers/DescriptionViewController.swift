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
    
    var buildingSelected: Int?
    
    var roomSelected: Int?

    var roomDescriptions = RoomDataLoader().roomData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = roomDescriptions[buildingSelected!].teachingRooms[roomSelected!]
        
        descriptionLabel.text = roomDescriptions[buildingSelected!].roomDescription[roomSelected!]
        
        imageView.image = UIImage(named: roomDescriptions[buildingSelected!].imageSource[roomSelected!])
    }

}
