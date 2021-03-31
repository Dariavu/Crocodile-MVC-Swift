//
//  Game.swift
//  Crocodile
//
//  Created by Daria Vuyiv on 2/12/21.
//  Copyright © 2021 Serhiy Rosovskyy. All rights reserved.
//

import Foundation

class Game {
    
    // MARK: - Singleton
    static let shared = Game()
    
    // MARK: - Initialization
    private init() { }
    
    // MARK: - Properties
    var teams = [Team.init(name: "Team1"), Team.init(name: "Team2")]
    var cards = [Card]()
    var currentIndex = 0
    
    // MARK: - Public
    func getCurrentTeam() -> Team {
        let teamIndex = currentIndex % teams.count
        return teams[teamIndex]
    }
    
    func getCards() {
        WordsAPI.fetchCards { cards in
            self.cards = cards.shuffled()
        }
    }
    
    func getCardForRound() -> Card {
        if currentIndex == cards.count {
            cards.append(contentsOf: cards)
        }
        return cards[currentIndex]
    }
}
