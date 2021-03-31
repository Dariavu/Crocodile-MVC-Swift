//
//  CurrentTeamViewController.swift
//  Crocodile
//
//  Created by Daria Vuyiv on 2/14/21.
//  Copyright © 2021 Serhiy Rosovskyy. All rights reserved.
//

import UIKit
import SnapKit

class CurrentTeamViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    
    // MARK: - Properties
    var currentTeam: Team!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: - Private
    private func setupUI() {
        
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9803921569, green: 0.8392156863, blue: 0.1960784314, alpha: 1)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "RatingTeamCell", bundle: nil), forCellReuseIdentifier: "RatingTeamCell")
        tableView.reloadData()
        
        goButton.layer.cornerRadius = 10
        
        // Data
        currentTeam = Game.shared.getCurrentTeam()
        
        roundLabel.text = "Round \(Game.shared.currentIndex + 1)"
        let team = Game.shared.getCurrentTeam()
        teamLabel.text = team.name
    }
    
    private func pushToTheFinalVC() {
        let storyboard: UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let nextVC = storyboard.instantiateViewController(identifier: "FinalResultViewController") as? FinalResultViewController else { return }
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    // MARK: - IBActions
    @IBAction func goTapped(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let nextVC = storyboard.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else { return }
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension CurrentTeamViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RatingTeamCell", for: indexPath) as? RatingTeamCell else { return UITableViewCell()}
        let team = Game.shared.teams[indexPath.row]
        cell.setupCell(team: team)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = #colorLiteral(red: 0.2274509804, green: 0.4980392157, blue: 0.2196078431, alpha: 1)
        
        let ratingTeamLabel = UILabel()
        
        ratingTeamLabel.text = "RATING OF TEAMS"
        ratingTeamLabel.textColor = .white
        ratingTeamLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
        headerView.addSubview(ratingTeamLabel)
        ratingTeamLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(10)
        }
        
        let totalNumbLabel = UILabel()
        totalNumbLabel.text = "100"
        totalNumbLabel.textColor = .white
        totalNumbLabel.font = UIFont.boldSystemFont(ofSize: 25)
        headerView.addSubview(totalNumbLabel)
        
        totalNumbLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalToSuperview().offset(10)
            
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
}
