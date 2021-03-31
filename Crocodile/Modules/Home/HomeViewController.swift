//
//  ViewController.swift
//  Crocodile
//
//  Created by Serhiy Rosovskyy on 31.01.2021.
//  Copyright © 2021 Serhiy Rosovskyy. All rights reserved.
//

import UIKit
import Koloda

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    private var isOpen = false
    private var startTime = 120
    private var timer: Timer?
    
    // MARK: - IBOutlets
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var timerLabel: UILabel!
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Private
    private func setupUI() {
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9607843137, green: 0.8392156863, blue: 0.1960784314, alpha: 1)
        
        cardView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "crocodile_background"))
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "QuestionWordCell", bundle: nil), forCellReuseIdentifier: "QuestionWordCell")
        tableView.isHidden = true
    }
    
    private func setupTimer(time: Int = 120) {
        timer?.invalidate()
        var current = time
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            current -= 1
            
            let time = current.getTimeFormatted()
            self.timerLabel.text = "\(time.minutes):\(time.seconds)"
            
            if current == 0 {
                timer.invalidate()
                self.openResults()
            }
            
        })
    }
    
    private func cardTapped() {
        if isOpen {
            isOpen = false
            cardView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "crocodile_background"))
        } else {
            isOpen = true
            cardView.backgroundColor = UIColor(red: 58 / 255, green: 128 / 255, blue: 56 / 255, alpha: 1)
        }
        
        UIView.transition(with: cardView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
    private func openResults() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let resultVC = storyBoard.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
        resultVC.card = Game.shared.getCardForRound()
        
        navigationController?.pushViewController(resultVC, animated: true)
    }
    
    // MARK: - IBActions
    @IBAction func startTapped(_ sender: Any) {
        if isOpen {
            timer?.invalidate()
            cardTapped()
            startButton.setTitle("START", for: .normal)
            startButton.backgroundColor = #colorLiteral(red: 0.2274509804, green: 0.4980392157, blue: 0.2196078431, alpha: 1)
            openResults()
            tableView.isHidden = true
        } else {
            setupTimer()
            cardTapped()
            startButton.setTitle("STOP", for: .normal)
            startButton.backgroundColor = .red
            tableView.isHidden = false
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.getCardForRound().getAllWords().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionWordCell", for: indexPath) as? QuestionWordCell else { return UITableViewCell() }
        let word = Game.shared.getCardForRound().getAllWords()[indexPath.row]
        cell.setupCell(word: word)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
}

/*
 
 1. Create table view in storyboard in green area
 2. Create IBOutlet connection to HomeVC
 3. Create Folder "Cells" in "Home" Folder
 4. Create "QuestionWordCell" with xib file
 5. Add label, connect to cell, add reuse id, add public func setupCell(word: Word) and change label text
 6. Setup cell in HomeVC
 7. As a result, all words should be visible in the card view
 
 */
