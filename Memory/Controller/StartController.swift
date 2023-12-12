//Name: Yash Kothari
//Date: March 10, 2021
//Program Name: StartController.swift
//Purpose: Controls the Start View Controller (the screen that appears when you first open the app)


import UIKit

class StartController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light //I have only designed the app for light mode as of now so all screens will have this line
        
        // Do any additional setup after loading the view.
    }
    
    

    @IBOutlet weak var gameMode: UISegmentedControl!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startToGame" //occurs when user clicks play button
        {
            let destinationVC = segue.destination as! PlayController
            destinationVC.mode = gameMode.titleForSegment(at: gameMode.selectedSegmentIndex) ?? "Programming" //passes the mode that the user selected to the PlayController
        }
    }
}

