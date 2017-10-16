//
//  KineticMolecularTheoryViewController.swift
//  Gas_law
//
//  Created by SETSI on 2017-05-30.
//  Copyright © 2017 ImpactCenter. All rights reserved.
//

import AVFoundation
import Foundation
import UIKit


class KineticMolecularTheoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    
    //let lightGreen = UIColor(red: 17/255, green: 173/255, blue: 110/255, alpha: 1)
    //let green = UIColor(red: 0/255, green: 153/255, blue: 90/255, alpha: 1)
    //let darkGreen = UIColor(red: 39/255, green: 81/255, blue: 61/255, alpha: 1)
    var screenHeight: CGFloat = 1;
    var screenWidth: CGFloat = 1;
    
    // Data model: These strings will be the data for the table view cells
    let theory: [String] = ["1. Particles move randomly ", "2. Collisions affect the trajectory of the particles ", "3. Particles are far apart", "4. No Interactive Force", "5. Elastic Collisions", "6. Kinetic Energy Depends on Temperature"]
    
    //Will store the text information that will be displayed for each postulate
    let descriptionText: [String] = ["Gases are composed of a large number of particles that behave like billiard balls which are in a state of random motion. ", " Unless they hit another particle or the walls of the container, they move in a straight line. ", "The space between the particles are significantly larger than the size of the particles, so most of the container is empty space.", "There are no attractive forces between the particles. Their only interaction with each other is when they collide.", "All the collisions are elastic. No energy is lost.", "The average kinetic energy of the gas is a function of its temperature. As the temperature increases, so does the average kinetic energy. Adjust the slider to see the change in the particle's motion"]
    
    let instructionText = "Please click on each button below to find out more details."
    
    @IBOutlet weak var tableView: UITableView!
    
    let animationOption: [Int] = [1,2,3,4,5,6]
    
    //http://sweettutos.com/2015/04/13/how-to-make-a-horizontal-paging-uiscrollview-with-auto-layout-in-storyboards-swift/ // how to implement a slids show
    
    
    var placeholder = "Placeholder Text" // used to store the description that the user will get based on their click
    
    var animateNum = 0 // used to store the animation option that the user will get based on their click
    
    let cellReuseIdentifier = "cell" // cell reuse id (cells that scroll out of view can be reused)
    
    var cellSpacingHeight: CGFloat = 1
    
    /*In this case, the tableView was created with several sections, each with one row to allow
     for spacing in between the cells for a cleaner look.*/
    
    
    var freeSpacing: CGFloat = 0.0 // will be used depending on whether it is the free or paid version
    
    var posSound = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* setting up click sound */
        
        let posSoundPath =  Bundle.main.path(forResource: "possound", ofType: "wav")
        do{
            posSound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: posSoundPath!))
        } catch{
            print(error)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        screenWidth = self.view.frame.size.width
        screenHeight = self.view.frame.size.height
        cellSpacingHeight = screenWidth * 0.025
        
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.layer.backgroundColor = GlobalConstants.offwhite.cgColor
        
        let title = UILabel(frame: CGRect(x: 20, y: 15 + freeSpacing, width: screenWidth - 40, height: 150 ))
        
        title.textColor = GlobalConstants.darkpurple
        title.textAlignment = .center
        title.text = "Kinetic Molecular Theory"
        title.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth*0.075))
        title.sizeToFit()
        
        self.view.addSubview(title)
        
        
        title.textColor = GlobalConstants.darkpurple
        title.numberOfLines = 0
        title.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth*0.075))
        //title.sizeToFit()
        title.center.x = self.view.center.x
        
        let assumptions = UILabel(frame: CGRect(x: 10, y: title.frame.height + screenHeight * 0.05 + freeSpacing, width: screenWidth - 20, height: 150))
        assumptions.textColor = GlobalConstants.darkpurple
        assumptions.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.040))
        assumptions.textAlignment = .center
        assumptions.text = "To explain the behaviour of gases, the following simplfying assumptions are made.\n Click on each button below to find out more details."
        self.view.addSubview(assumptions)
        
        assumptions.center.x = self.view.center.x
        assumptions.numberOfLines = 0
        assumptions.lineBreakMode = .byWordWrapping
        assumptions.lineBreakMode = .byWordWrapping
        //assumptions.sizeToFit()
    
        
        //center everything horizontally and stylize the UIComponents
        
        tableView.layer.cornerRadius = 10
        tableView.backgroundColor=UIColor.clear
        
        
        tableView.frame = CGRect(x: 20, y: title.frame.height + assumptions.frame.height + screenHeight * 0.035 + freeSpacing, width: screenWidth - 30, height : screenHeight * 0.6 )
        
        tableView.center.x = self.view.center.x
        
        //self.addGradient()
        
        tableView.alwaysBounceVertical = false;//prevents bouncing of table
      
    }
    
    
    //creates gradient between two specified colours
    func addGradient(){
        
        let gradient:CAGradientLayer = CAGradientLayer()
        gradient.frame.size = self.view.frame.size
        gradient.colors = [UIColor.black.withAlphaComponent(0.85).cgColor,UIColor.black.withAlphaComponent(0.65).cgColor] //Or any colors
        self.view.layer.insertSublayer(gradient, at: 0)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        // set the text from the data model
        cell.textLabel?.text = self.theory[indexPath.section]
        cell.textLabel?.textColor = GlobalConstants.darkpurple
        
        
        //  title.font = title.font.withSize(screenWidth * 0.075)
        cell.textLabel?.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.04)) //screenWidth * 0.05)
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        
        //Stylize the cell, and change its appearance upon tap
        cell.layer.borderColor = GlobalConstants.pink.cgColor
        cell.backgroundColor = GlobalConstants.pink
        cell.layer.cornerRadius = 10
        
        cell.layer.borderWidth = GlobalConstants.borderW
        
        cell.selectionStyle = .default;
        let view = UIView()
        //self.view.layer.borderWidth = GlobalConstants.borderW
        self.view.layer.borderColor = GlobalConstants.yellow.cgColor
        view.backgroundColor = GlobalConstants.yellow
        view.layer.cornerRadius = 10;
        cell.selectedBackgroundView = view
        // cell.heigt
        //cell.sizeToFit()
        
        
        // eliminates extra whitespace at the bottom of the tableview
        var frame = self.tableView.frame;
        frame.size.height = self.tableView.contentSize.height;
        self.tableView.frame = frame;
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.theory.count
    }
    
    // Make the background color show through between spaced out cells
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        posSound.play()// play sound
        //This information will be passed onto the next view to display the right info to the user
        placeholder = self.descriptionText[indexPath.section]
        animateNum = self.animationOption [indexPath.section]
        
        self.performSegue(withIdentifier: "postulateSegue", sender: self)
        
        
        
    }
    
    //allows word wrapping in the cells
    func allowMultipleLines(tableViewCell: UITableViewCell) {
        tableViewCell.textLabel?.numberOfLines = 0
        tableViewCell.textLabel?.lineBreakMode = .byWordWrapping
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get a reference to the second view controller
        let tableClick = segue.destination as! InfoViewController
        //based on the userclick, the infomation in the InforViewController class is modified
        tableClick.display = placeholder
        tableClick.animate = animateNum
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return screenWidth * 0.1;//Choose your custom row height
    }
    
    
    
}

