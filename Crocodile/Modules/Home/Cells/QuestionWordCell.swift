//
//  QuestionWordCell.swift
//  Crocodile
//
//  Created by Daria Vuyiv on 2/8/21.
//  Copyright © 2021 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

class QuestionWordCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var wordLabel: UILabel!
    
    // MARK: - Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Public
    func setupCell(word: Word) {
        wordLabel.text = word.name
    }
    
}
