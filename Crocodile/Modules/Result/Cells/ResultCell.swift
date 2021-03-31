//
//  ResultCell.swift
//  Crocodile
//
//  Created by Daria Vuyiv on 2/5/21.
//  Copyright © 2021 Serhiy Rosovskyy. All rights reserved.
//

import UIKit
import SimpleCheckbox


class ResultCell: UITableViewCell {
    
    // MARK: - Properties 
    var wordSelectedCallback: ((Bool) -> Void)?
    var pointsCallback: ((_ points: Int) -> Void)?
    
    // MARK: - IBOutlets
    @IBOutlet weak var checkBox: Checkbox! 
    @IBOutlet weak var wordLabel: UILabel!
    
    // MARK: - Initilization
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        prepareBind()
    }
    
    // MARK: - Public
    func setupCell(word: Word) {
        wordLabel.text = word.name
        
        
    }
    
    // MARK: - Private
    private func setupUI() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        addGestureRecognizer(tapGesture)
        
        selectionStyle = UITableViewCell.SelectionStyle.none
    }
    
    private func prepareBind() {
        checkBox.valueChanged = { (isChecked) in
            self.wordSelectedCallback?(isChecked)
        }
    }
    
    @objc private func cellTapped() {
        checkBox.isChecked = !checkBox.isChecked
        wordSelectedCallback?(checkBox.isChecked)
    }
}
 
