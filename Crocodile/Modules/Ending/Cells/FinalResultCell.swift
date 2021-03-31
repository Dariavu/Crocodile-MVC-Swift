//
//  FinalResultCell.swift
//  Crocodile
//
//  Created by Daria Vuyiv on 2/18/21.
//  Copyright © 2021 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

class FinalResultCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var teamNameLabel: UILabel!
    @IBOutlet private weak var pointsLabel: UILabel!
    
    // MARK: - Initization
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - public
    func setupCell(team: Team) {
        teamNameLabel.text = team.name
        pointsLabel.text = "\(String(describing: team.points))"
    }
}
