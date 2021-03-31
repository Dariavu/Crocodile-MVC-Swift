//
//  Card.swift
//  Crocodile
//
//  Created by Serhiy Rosovskyy on 31.01.2021.
//  Copyright © 2021 Serhiy Rosovskyy. All rights reserved.
//

import Foundation
import SwiftyJSON

class Card {
    
    // MARK: - Properties
    var nouns: [Word]?
    var verbs: [Word]?
    var person: Word?
    var country: Word?
    var proverb: Word?
    
    // MARK: - Initialization
    init(json: JSON) {
        let nounsJSON = json["nouns"].arrayValue
        nouns = nounsJSON.map { Word(json: $0) }
        
        let verbsJSON = json["verbs"].arrayValue
        verbs = verbsJSON.map { Word(json: $0) }
        
        person = Word(json: json["person"])
        country = Word(json: json["country"])
        proverb = Word(json: json["proverb"])
    }
    
    // MARK: - Public
    func getAllWords() -> [Word] {
        var words = [Word]()
        words.append(contentsOf: nouns ?? [])
        words.append(contentsOf: verbs ?? [])
        if let person = person {
            words.append(person)
        }
        if let country = country {
            words.append(country)
        }
        if let proverb = proverb {
            words.append(proverb)
        }
        return words
    }
    
}
