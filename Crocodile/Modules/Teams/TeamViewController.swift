//
//  TeamViewController.swift
//  Crocodile
//
//  Created by Daria Vuyiv on 2/10/21.
//  Copyright © 2021 Serhiy Rosovskyy. All rights reserved.
//

import UIKit
import Foundation

class TeamViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: - Properties
    var lastTeamIndex = 2
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Private
    private func setupUI() {
        
        // NavBar
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.setHidesBackButton(true, animated: true)
        
        // TableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TeamCell", bundle: nil), forCellReuseIdentifier: "TeamCell")
        tableView.register(UINib(nibName: "AddTeamCell", bundle: nil), forCellReuseIdentifier: "AddTeamCell")
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 60.0
        tableView.reloadData()
        
        continueButton.layer.cornerRadius = 10
        
        
    }
    
    private func changeTeamName(for index: Int) {
        let alertController = UIAlertController(title: "Add new Team name", message: nil, preferredStyle: .alert)

        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Team name"
        }

        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            if let teamName = firstTextField.text, !teamName.isEmpty {
                Game.shared.teams[index].name = teamName
                self.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
            }
        })

        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil )

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - IBActions
    @IBAction func continueTapped(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let nextVС = storyBoard.instantiateViewController(withIdentifier: "CurrentTeamViewController") as? CurrentTeamViewController else { return }
        navigationController?.pushViewController(nextVС, animated: true)
    }
}

extension TeamViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.teams.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == Game.shared.teams.count {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddTeamCell", for: indexPath) as? AddTeamCell else { return UITableViewCell()}
            
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath) as? TeamCell else { return UITableViewCell()}
        
        let team = Game.shared.teams[indexPath.row]
        cell.setupCell(team: team)
        
        cell.changeNameCallback = { [weak self] in
            self?.changeTeamName(for: indexPath.row)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let totalRows = tableView.numberOfRows(inSection: indexPath.section)
        if indexPath.row == totalRows - 1 {
            Game.shared.teams.append(Team(name: "Team\(lastTeamIndex + 1)"))
            lastTeamIndex += 1
            tableView.insertRows(at: [indexPath], with: .automatic)
            print(Game.shared.teams)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
        Game.shared.teams.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
