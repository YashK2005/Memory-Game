//Name: Yash Kothari
//Date: March 14, 2021
//Program Name: WinController.swift
//Purpose: Controls the Win View Controller (the screen that appears after you finish the game.)


import UIKit

class WinController: UIViewController {
    var score: Int = 0
    var highscore: Int = 0
    @IBOutlet weak var turnsTakenLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    
    override func viewDidLoad() {
        navigationItem.hidesBackButton = true
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light

        turnsTakenLabel.text = "Congratulations! You finished the game in \(score) turns!" //telling user their score
        // Do any additional setup after loading the view.
        
        if score < highscore { //if new highscore is set
            highscoreLabel.text = "NEW HIGHSCORE!" //tells user that they set a new highscore
            let defaults = UserDefaults.standard
            defaults.set(score, forKey: "scoreKey") //sets highscore and saves it on device
            
        }
    }
    @IBAction func backToHomeClicked(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true) //goes back to home screen
    }
    

}


