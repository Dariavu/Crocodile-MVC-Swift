//
//  TeamCell.swift
//  Crocodile
//
//  Created by Daria Vuyiv on 2/10/21.
//  Copyright © 2021 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

class TeamCell: UITableViewCell {
    
    var changeNameCallback: (() -> ())?
    
    // MARK: - IBOutlets
    @IBOutlet weak var teamLabel: UILabel!
    
    // MARK: - Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    // MARK: - Publics
    func setupCell(team: Team) {
        teamLabel.text = team.name
    }
    
    // MARK: - Private
    private func setupUI() {
        teamLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        
        selectionStyle = .none
    }
    
    // MARK: - IBActions
    @IBAction func changeTeamNameTapped(_ sender: Any) {
        changeNameCallback?()
    }
}
