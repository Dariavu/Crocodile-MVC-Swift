//
//  WordsAPI.swift
//  Crocodile
//
//  Created by Serhiy Rosovskyy on 31.01.2021.
//  Copyright © 2021 Serhiy Rosovskyy. All rights reserved.
//

import Foundation
import SwiftyJSON

class WordsAPI {
    static func fetchCards(completion: @escaping ([Card]) -> Void) {
        guard let path = Bundle.main.path(forResource: "cards", ofType: "json") else { return }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let json = try JSON(data: data)
            let cardsJSON = json["cards"].arrayValue
            
            let cards = cardsJSON.map { Card(json: $0) }
            
            completion(cards)
        } catch {
            print(error)
        }
    }
}
