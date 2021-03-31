//
//  AppDelegate.swift
//  Crocodile
//
//  Created by Serhiy Rosovskyy on 31.01.2021.
//  Copyright © 2021 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

/*
 1. + Create new folder "Teams"
 2. + Create VC "TeamViewController"
 
 STORYBOARD:
 3. + Create view controller in the storyboard, associate it with corresponding class
 4. + Make the VC in the storyboard as initial
 5. + Make the screen embedded in navigation
 6. + Give it the title "Teams"
 7. + Add button at the bottom and make it look like in alias "Continue"
 8. + Add table view and make constraints (top, left, right): 0 to superview, bottom: 0 to button
 9. + Create folder "Cells" and create cell "TeamCell"
 10. + Add label and create IBOutlet
 
 CODE:
 11. + Create Model "Team" and give it the "name", "points" properties
 12. + Create a property in TeamViewController: private var teams = [Team]()
 13. + In setupUI function add two random(as you wish) teams to "teams" list
 14. + Setup table view in TeamViewController
 15. + Number of rows = number of teams
 16. + In TeamCell create function setupCell(team: Team), this function should set the text to the label
 16. in cellForRowAt create cell, call setupCell function and pass the corresponding team
 17. For now, do not create + button
 
 */

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Game.shared.getCards()
        
        return true
    }
}

