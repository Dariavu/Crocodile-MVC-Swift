//
//  Word.swift
//  Crocodile
//
//  Created by Serhiy Rosovskyy on 31.01.2021.
//  Copyright © 2021 Serhiy Rosovskyy. All rights reserved.
//

import Foundation
import SwiftyJSON

class Word {
    
    // MARK: - Properties
    var name: String?
    var points: Int?
    var type: String?
    
    // MARK: - Initialization
    init(json: JSON) {
        name = json["name"].stringValue
        points = json["points"].intValue
        type = json["type"].stringValue
    }
}
