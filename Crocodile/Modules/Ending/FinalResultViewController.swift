//
//  FinalResultViewController.swift
//  Crocodile
//
//  Created by Daria Vuyiv on 2/18/21.
//  Copyright © 2021 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

final class FinalResultViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    
    // MARK: - Private
    private func setupUI() {
        
        // NavBar
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        // TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FinalResultCell", bundle: nil), forCellReuseIdentifier: "FinalResultCell")
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - IBActions
    @IBAction private func newGameTapped(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)

        guard let teamsViewController = storyboard.instantiateViewController(withIdentifier: "TeamViewController") as? TeamViewController else { return }
        
        navigationController?.pushViewController(teamsViewController, animated: true)
    }
}


extension FinalResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FinalResultCell", for: indexPath) as? FinalResultCell else { return UITableViewCell() }
        let team = Game.shared.teams[indexPath.row]
        cell.setupCell(team: team)
        
        // catch the callback
        
        return cell
    } 
    
    
}
