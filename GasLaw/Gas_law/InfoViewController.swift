//
//  InfoViewController.swift
//  KineticMolecularTheory
//
//  Created by SETSI on 2017-05-16.
//  Copyright © 2017 SETSI. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class CustomTwoClassNavigationViewController: UINavigationController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return UIInterfaceOrientation.portrait
    }
}


class InfoViewController: UIViewController  {
    
    // @IBOutlet weak var returnButton: UIButton!
    // @IBOutlet weak var descriptionLabel: UILabel!
    var display = "PlaceholderString" // will hold description of postulate
    var animate = 0 //Will hold which animation to run
    
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    //Declare colors
    //let lightGreen = UIColor(red: 17/255, green: 173/255, blue: 110/255, alpha: 1)
    //let darkGreen = UIColor(red: 39/255, green: 81/255, blue: 61/255, alpha: 1)
    
    let v = AnimateViewController()
    
    var negSound = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting up sound
        let negSoundPath =  Bundle.main.path(forResource: "negsound", ofType: "wav")
        do{
            negSound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: negSoundPath!))
        } catch{
            print(error)
        }
        
        let screenWidth = self.view.frame.size.width
        let screenHeight = self.view.frame.size.height
        let border = CGFloat(screenWidth * 0.1);
        
        //This displays the description and wraps it around into as many lines as needed
        descriptionLabel.text = "\(display)"
        descriptionLabel?.numberOfLines = 0
        descriptionLabel?.lineBreakMode = .byWordWrapping
        descriptionLabel?.frame = CGRect(x: border , y: border, width : screenWidth * 0.8, height: screenWidth * 0.2)
        
        descriptionLabel.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth*0.035))
        descriptionLabel.sizeToFit()
        
        //creates view for AnimateViewController
        
        let size = CGFloat(screenWidth * 0.80);
        v.view.frame=CGRect(x: ((screenWidth / 2)), y: descriptionLabel.frame.height + border * 2 , width: size , height: size)
        v.animationToRun = animate // load initial picture based on cell clicked
        v.view.center = self.view.center
        self.view.addSubview(v.view)
        self.view.layer.backgroundColor = GlobalConstants.lightpurple.cgColor
        
        //call function to draw appropriate animation
        v.drawAnimation(animateOp: animate)
        
        //center the UI Components and stylize
        v.view.center.x = self.view.center.x
        v.view.layer.borderWidth = GlobalConstants.borderW
        v.view.layer.borderColor = GlobalConstants.offwhite.cgColor
        v.view.layer.cornerRadius = 10
        
        descriptionLabel.center.x = self.view.center.x
        descriptionLabel.textColor = GlobalConstants.offwhite
        
        
        returnButton.backgroundColor = GlobalConstants.pink
        returnButton.titleLabel?.text = " Return "
        returnButton.layer.cornerRadius = 10
        returnButton.layer.borderWidth = GlobalConstants.borderW
        returnButton.layer.borderColor = GlobalConstants.pink.cgColor
        returnButton.setTitleColor(GlobalConstants.darkpurple, for: .normal)
        returnButton.frame = CGRect(x: (screenWidth / 2) - 50, y: v.view.frame.height + descriptionLabel.frame.height + border * 2.25,  width: 300, height: 70)
        
        returnButton.frame = CGRect(x: (screenWidth / 2) - 50, y: screenHeight - border * 2,  width: 300, height: 70)
        
        returnButton.titleLabel?.font = UIFont.init(name: "HelveticaNeue-Light", size :screenWidth*0.05)
        
        returnButton.sizeToFit()
        returnButton.center.x = self.v.view.center.x
        
        //self.addGradient()// add gradient
        
        // add gesture
        let sampleTapGesture = UITapGestureRecognizer(target: self, action: #selector(InfoViewController.handleTap(recognizer:)))
        v.view.addGestureRecognizer(sampleTapGesture)
    }
    
    func handleTap(recognizer:UITapGestureRecognizer) {
        v.drawPicture()//will load correct picture based on tap
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func returnButton(sender: AnyObject) {
        //dismiss your viewController
        negSound.play()
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    func addGradient(){
        
        let gradient:CAGradientLayer = CAGradientLayer()
        gradient.frame.size = self.view.frame.size
        gradient.colors = [UIColor.black.withAlphaComponent(0.85).cgColor,UIColor.black.withAlphaComponent(0.65).cgColor] //Or any colors
        self.view.layer.insertSublayer(gradient, at: 0)
        
    }
    
}
