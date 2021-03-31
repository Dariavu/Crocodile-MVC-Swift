//
//  Int+Extension.swift
//  Crocodile
//
//  Created by Serhiy Rosovskyy on 31.01.2021.
//  Copyright © 2021 Serhiy Rosovskyy. All rights reserved.
//

import Foundation

typealias MinutesSeconds = (minutes: String, seconds: String)

extension Int {
    func getTimeFormatted() -> MinutesSeconds {
        let minutes = String(format: "%02d", self / 60)
        let seconds = String(format: "%02d", self - (self / 60) * 60)
        
        return (minutes: minutes, seconds: seconds)
    }
}
