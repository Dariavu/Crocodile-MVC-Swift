//
//  ResultViewController.swift
//  Crocodile
//
//  Created by Serhiy Rosovskyy on 31.01.2021.
//  Copyright © 2021 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

// TODO: Change Done button UI +

class ResultViewController: UIViewController {
    
    // MARK: - Properties
    var card: Card?
    var points = 0
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var doneButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: - Private
    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ResultCell", bundle: nil), forCellReuseIdentifier: "ResultCell")
        
        doneButton.layer.cornerRadius = 10
    }
    
    private func addPointsToTeam() {
        let currentIndexTeam = Game.shared.currentIndex % Game.shared.teams.count
        Game.shared.teams[currentIndexTeam].points += points
    }
    
    
    // MARK: - IBActions
    @IBAction func doneTapped(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        addPointsToTeam()
        let currentIndexTeam = Game.shared.currentIndex % Game.shared.teams.count
        if Game.shared.teams[currentIndexTeam].points >= 50 {
            guard let finalResultVC = storyboard.instantiateViewController(withIdentifier: "FinalResultViewController") as? FinalResultViewController else { return }
            navigationController?.pushViewController(finalResultVC, animated: true)
        } else {
            guard let nextViewController = storyboard.instantiateViewController(identifier: "CurrentTeamViewController") as? CurrentTeamViewController else { return }
            navigationController?.pushViewController(nextViewController, animated: true)
        }
        Game.shared.currentIndex += 1
    }
    
}

// MARK: - Table View
extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return card?.getAllWords().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as? ResultCell else { return UITableViewCell() }
        
        if let word = card?.getAllWords()[indexPath.row] {
            cell.setupCell(word: word)
            cell.wordSelectedCallback = { (isChecked) in
                if isChecked {
                    self.points += word.points ?? 0
                } else {
                    self.points -= word.points ?? 0
                }
            }
        }
        
        return cell
    }
}
