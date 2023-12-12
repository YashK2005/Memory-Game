//Name: Yash Kothari
//Date: March 14, 2021
//Program Name: LearningController.swift
//Purpose: Controls the Learning View Controller (the screen with the info about programming languages)


import UIKit

class LearningController: UIViewController {
    @IBOutlet weak var LanguageLabel: UILabel!
    @IBOutlet weak var InfoLabel: UILabel!

    var last_image_clicked: Int = 0
    var languagesArray = ["JavaScript", "Swift", "Scala", "Go", "Python", "Ruby", "C#", "C++", "HTML", "Bash", "R", "PHP"] //the titles of the info I will display
    //the array of all the info I will display
    var infoArray = ["JavaScript is the most popular language among developers. It is primarily used for front-end development and many of the most popular websites, such as Facebook, Twitter, Gmail, and YouTube use JavaScript.",
        "Swift is used to develop iOS and macOS applications. It was built specifically for Apple products, and allows you to build apps for Macs, iPhones, iPads, Apple Watches, and Apple TVs. This game that you are playing was built with Swift.",
        "Scala combines the best features of Java but with a modern twist. Scala allows for concurrent programming and can elevate the quality of code to resemble pure math.",
        "Go is a low-level lanuage ideal for engineers who want to work in systems programming. It is similar to C and C++ but the syntax is easier to learn fro beginners. It is good for building web servers, data pipelines, and machine learning packages.",
        "Python is arguably the most user-friendly programming language for beginners because of its English-like syntax. It is a very versatile language with many packages that can be used in computing, mathematics, engineering, data science, machine learning, and image processing.",
        "Ruby is commonly used for web development. It has a reputation for having a very friendly and helpul user communities. It also has straightforward syntax so it is an easy language ot learn. In the past, Twitter AirBnB, Bloomberg, and Shopify have all used Ruby to build their websites.",
        "C# (C Sharp) is an object-oreinted language similar to C. It was orignially desigend by Microsoft to build Windows applications. It syntax is very similar to other C languages so it can be very easy to learn depending on previous experience. C# is recommended for building 3D, 2D, and Virtual Reality video games.",
        "C++ is a general-purpose programming language and has very similar syntax to C. It can be used to develop operating systems, browsers, video games, and much more. It supports object-oriented, functional, and procedural programming.",
        "Hypertext Markup Language (HTML) is used to develop websites. It can be used in conjunction with Cascading Style Sheets and JavaScript. HTML elements are the building blocks of many webpages.",
        "Bash is a Unix shell and command line language. It is used as the default shell for Linux, and can be also used with Windows 10 and macOS. It is a command processor and gives the user a lot of control and power.",
        "R is heavily used in statistical analytics and machine learning applications. The language is extensible and runs on many operating systems. Many large companies have adopted R in order to analyze their massive data sets.",
        "PHP is used for server-side web development when a website must frequently request information from a server. It is an older language so there are many users who have created packages to make PHP better. It is also easy to debug."
    ]
    var linkArray = ["https://www.edureka.co/blog/what-is-java/", "https://developer.apple.com/swift/", "https://www.edureka.co/blog/what-is-scala/", "https://yalantis.com/blog/why-use-go/", "https://www.python.org/doc/essays/blurb/", "https://www.ruby-lang.org/en/about/", "https://www.c-sharpcorner.com/article/what-is-c-sharp/",
    "https://www.bestprogramminglanguagefor.me/why-learn-c-plus-plus",
    "https://www.computerhope.com/jargon/h/html.htm#:~:text=HTML%20code%20ensures%20the%20proper,overlaid%20to%20change%20its%20appearance.",
    "https://opensource.com/resources/what-bash",
    "https://data-flair.training/blogs/why-learn-r/",
    "https://www.bluelinemedia.co.uk/blog/entry/web-design/blog/why-php"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light

        LanguageLabel.text = languagesArray[last_image_clicked] //setting the labels to proper text
        InfoLabel.text = infoArray[last_image_clicked]
        print(last_image_clicked)
       
        
        // Do any additional setup after loading the view.
    }

    @IBAction func backToGame(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil) //going back to play view controller
    }
    
    @IBAction func linkButton(_ sender: UIButton) {
        if let url = URL(string: linkArray[last_image_clicked]) { //ensures that the app won't crash if the url is invalid (eg. website gets taken down or link changes)
            UIApplication.shared.open(url)
        }
    }
}
