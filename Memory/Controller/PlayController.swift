//Name: Yash Kothari
//Date: March 12, 2021
//Program Name: PlayController.swift
//Purpose: Controls the Play View Controller (the screen with the actual memory game)

import UIKit
class PlayController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel! //allows me to change properties of scoreLabel
    var non_shuffled_array: [UIImage] = [#imageLiteral(resourceName: "Java"), #imageLiteral(resourceName: "Swift"), #imageLiteral(resourceName: "Scala"), #imageLiteral(resourceName: "Go"), #imageLiteral(resourceName: "Python"), #imageLiteral(resourceName: "Ruby"), #imageLiteral(resourceName: "C# Logo"), #imageLiteral(resourceName: "C++ Logo"), #imageLiteral(resourceName: "HTML"), #imageLiteral(resourceName: "Bash"), #imageLiteral(resourceName: "R"), #imageLiteral(resourceName: "Php"), #imageLiteral(resourceName: "Java"), #imageLiteral(resourceName: "Swift"), #imageLiteral(resourceName: "Scala"), #imageLiteral(resourceName: "Go"), #imageLiteral(resourceName: "Python"), #imageLiteral(resourceName: "Ruby"), #imageLiteral(resourceName: "C# Logo"), #imageLiteral(resourceName: "C++ Logo"), #imageLiteral(resourceName: "HTML"), #imageLiteral(resourceName: "Bash"), #imageLiteral(resourceName: "R"), #imageLiteral(resourceName: "Php")] //unrandomized list so I can check which logo was last clicked
    var images_array : [UIImage] = [#imageLiteral(resourceName: "Java"), #imageLiteral(resourceName: "Swift"), #imageLiteral(resourceName: "Scala"), #imageLiteral(resourceName: "Go"), #imageLiteral(resourceName: "Python"), #imageLiteral(resourceName: "Ruby"), #imageLiteral(resourceName: "C# Logo"), #imageLiteral(resourceName: "C++ Logo"), #imageLiteral(resourceName: "HTML"), #imageLiteral(resourceName: "Bash"), #imageLiteral(resourceName: "R"), #imageLiteral(resourceName: "Php"), #imageLiteral(resourceName: "Java"), #imageLiteral(resourceName: "Swift"), #imageLiteral(resourceName: "Scala"), #imageLiteral(resourceName: "Go"), #imageLiteral(resourceName: "Python"), #imageLiteral(resourceName: "Ruby"), #imageLiteral(resourceName: "C# Logo"), #imageLiteral(resourceName: "C++ Logo"), #imageLiteral(resourceName: "HTML"), #imageLiteral(resourceName: "Bash"), #imageLiteral(resourceName: "R"), #imageLiteral(resourceName: "Php")].shuffled() //randomized list containing the pictures that will be used
    var buttons_clicked : [Int] = [] //the names (numbers) of buttons clicked
    var turns = 0 //number of turns user has taken so far
    var buttons : [UIButton] = [] //list of buttons pressed, allows me to store and change properties of clicked buttons later on
    var shouldClearButtonImage = false //should the images be cleared from the buttons or should they stay?
    var matches = -1 //number of times the user has matched two images
    var highscore = 1000
    var last_image_clicked = #imageLiteral(resourceName: "Broccoli") //most recent image clicked --> set to a image at the start so that it is intiallized as a "UI Image" Type variable
    var mode: String = "Programming" //the mode that user selected on the homescreen
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light//haven't developed for dark mode yet so makes sure that the display will be the same no matter if the user is on dark or light mode
        let defaults = UserDefaults.standard
        highscore = defaults.integer(forKey: "scoreKey")
        if highscore == 0 //no highscore set yet
        {
            highscore = 1000 //sets the highscore to a really high value if it doesn't exist because otherwise it will autmatically be set to 0
        }
        scoreLabel.text = "Turns Taken: \(turns), High Score: \(highscore)" //This and the above 2 lines get the user's highscore and displays it beside the user's current score
        if mode == "Fruits" //user selected fruits on homescreen
        {
            non_shuffled_array = [#imageLiteral(resourceName: "Pineapple"), #imageLiteral(resourceName: "Watermelon"), #imageLiteral(resourceName: "Apple"), #imageLiteral(resourceName: "Orange"), #imageLiteral(resourceName: "Kiwi"), #imageLiteral(resourceName: "Grapes"), #imageLiteral(resourceName: "Pear"), #imageLiteral(resourceName: "Strawberry"), #imageLiteral(resourceName: "Carrot"), #imageLiteral(resourceName: "Corn"), #imageLiteral(resourceName: "Broccoli"), #imageLiteral(resourceName: "Lemon"), #imageLiteral(resourceName: "Pineapple"), #imageLiteral(resourceName: "Watermelon"), #imageLiteral(resourceName: "Apple"), #imageLiteral(resourceName: "Orange"), #imageLiteral(resourceName: "Kiwi"), #imageLiteral(resourceName: "Grapes"), #imageLiteral(resourceName: "Pear"), #imageLiteral(resourceName: "Strawberry"), #imageLiteral(resourceName: "Carrot"), #imageLiteral(resourceName: "Corn"), #imageLiteral(resourceName: "Broccoli"), #imageLiteral(resourceName: "Lemon"),] //array of images to use
            images_array = non_shuffled_array.shuffled() //shuffles array for randomization
        }
        if mode == "Sports" //user selected sports on homescreen
        {
            non_shuffled_array = [#imageLiteral(resourceName: "Hockey"), #imageLiteral(resourceName: "Tennis"), #imageLiteral(resourceName: "Soccer"), #imageLiteral(resourceName: "Biking"), #imageLiteral(resourceName: "Ping Pong"), #imageLiteral(resourceName: "Football"), #imageLiteral(resourceName: "Basketball"), #imageLiteral(resourceName: "Swim"), #imageLiteral(resourceName: "Baseball"), #imageLiteral(resourceName: "Ski"), #imageLiteral(resourceName: "Golf"), #imageLiteral(resourceName: "Bowling"), #imageLiteral(resourceName: "Hockey"), #imageLiteral(resourceName: "Tennis"), #imageLiteral(resourceName: "Soccer"), #imageLiteral(resourceName: "Biking"), #imageLiteral(resourceName: "Ping Pong"), #imageLiteral(resourceName: "Football"), #imageLiteral(resourceName: "Basketball"), #imageLiteral(resourceName: "Swim"), #imageLiteral(resourceName: "Baseball"), #imageLiteral(resourceName: "Ski"), #imageLiteral(resourceName: "Golf"), #imageLiteral(resourceName: "Bowling")]
            images_array = non_shuffled_array.shuffled()
        }
    }
    //if a button is pressed the following function will happen
    @IBAction func buttonPressed(_ sender: UIButton) {
        

        if shouldClearButtonImage == true { //if the two images don't match up they should be flipped over
            buttons[1].setImage(nil, for: .normal) //clears the images
            buttons[0].setImage(nil, for: .normal)
            buttons_clicked.removeAll() //clears arrays
            buttons.removeAll()
        }
        if buttons.contains(sender) { //makes sure that user can't click the same button twice
        } else {
            shouldClearButtonImage = false
            let button_number = Int(sender.currentTitle!)! //gets name of button clicked
            sender.setImage(images_array[button_number], for: .normal) //sets the image of the button clicked to whatever was at the index of the images_array
            
            buttons_clicked.append(button_number) //adds the button's name to list of clicked buttons
            buttons.append(sender) //adds button to list of clicked buttons
            let current_image = images_array[button_number]
            if buttons_clicked.count == 2 { //if two buttons are clicked, it will check if their images are the same
                let prev_image = images_array[buttons_clicked[0]]
                
                turns = turns + 1 //increases number of turns taken and updates the scoreLabel
                scoreLabel.text = "Turns Taken: \(turns), High Score: \(highscore)"
                if current_image == prev_image { //if images are the same
                    last_image_clicked = current_image
                    buttons[0].isEnabled = false //won't allow button to be clicked any more
                    buttons[1].isEnabled = false
                    
                    buttons_clicked.removeAll() //clears the array's containing button and button_name
                    buttons.removeAll()
                    matches = matches + 1 //increases number of matches by 1
                    if matches < 11 && mode == "Programming" {
                        performSegue(withIdentifier: "MemoryToLearning", sender: self) //goes to learning screen if game isn't over yet and the user selected programming mode
                    } else if matches == 11 {
                        performSegue(withIdentifier: "MemoryToWin", sender: self)
                        //goes to win screen if game is complete
                    }
                    
                } else {
                    shouldClearButtonImage = true //images will be cleared the next time a button is clicked if the images don't match
                    
                }
            }
        }
        
    }
    //when the viewController is about to change
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MemoryToLearning" { //Going to learning screen
            let destinationVC = segue.destination as! LearningController
            print(images_array.firstIndex(of: last_image_clicked)!)
            destinationVC.last_image_clicked = non_shuffled_array.firstIndex(of: last_image_clicked)!
        }
        if segue.identifier == "MemoryToWin" { //Going to win screen
            let destinationVC = segue.destination as! WinController
            destinationVC.score = turns //sending the score and highscore to the win view controller
            destinationVC.highscore = highscore
        }
    }
}


