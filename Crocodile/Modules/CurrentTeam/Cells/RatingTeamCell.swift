//
//  RatingTeamCell.swift
//  Crocodile
//
//  Created by Daria Vuyiv on 2/15/21.
//  Copyright © 2021 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

class RatingTeamCell: UITableViewCell {
    
    // MARK: - Properties
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    // MARK: - Initization
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Public
    func setupCell(team: Team) {
        teamLabel.text = team.name
        pointsLabel.text = "\(String(describing: team.points))"
    }
}
