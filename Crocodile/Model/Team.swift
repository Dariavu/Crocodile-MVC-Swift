//
//  Team.swift
//  Crocodile
//
//  Created by Daria Vuyiv on 2/10/21.
//  Copyright © 2021 Serhiy Rosovskyy. All rights reserved.
//

import Foundation

class Team {
    
    // MARK: - Properties
    var name: String?
    var points: Int = 0
    
    // MARK: - Initialization
    init(name: String) {
        self.name = name
    }
}

let team = Team(name: "DaraZaebalaPlakaty")
