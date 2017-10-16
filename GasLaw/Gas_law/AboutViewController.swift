//
//  AboutViewController.swift
//  Gas_law
//
//  Created by SETSI on 2017-05-30.
//  Copyright © 2017 ImpactCenter. All rights reserved.
//

import UIKit
import Foundation
import StoreKit

class CustomThreeClassNavigationViewController: UINavigationController{
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return UIInterfaceOrientation.portrait
    }
}

extension String {
    var html2AttStr: NSAttributedString? {
        return try? NSAttributedString(data: Data(utf8), options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue], documentAttributes: nil)
    }
}

class AboutViewController: UIViewController {
    
    //let lightGreen = UIColor(red: 17/255, green: 173/255, blue: 110/255, alpha: 1)
    //let darkGreen = UIColor(red: 39/255, green: 81/255, blue: 61/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth = self.view.frame.size.width
        let screenHeight = self.view.frame.size.height
       
        self.view.layer.backgroundColor = GlobalConstants.lightpurple.cgColor
        let title = UILabel(frame: CGRect(x: 20, y: 15, width: screenWidth - 40, height: 150 ))
        
        title.textColor = GlobalConstants.offwhite
        title.textAlignment = .center
        title.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.07))
        title.text = "About This App"
        
        self.view.addSubview(title)
        
        title.textColor = GlobalConstants.offwhite
        title.numberOfLines = 0
        title.sizeToFit()
        title.center.x = self.view.center.x
        
        let assumptions = UILabel(frame: CGRect(x: 10, y: title.frame.maxY + 10 , width: screenWidth - 20, height: 150))
        assumptions.textColor = GlobalConstants.offwhite
        assumptions.textAlignment = .left
        assumptions.text = "This app is designed to help students understand and explore the relationship between various quantities in the ideal gas law PV = nRT. It contains an interactive interface for students to learn the relationship between the given quantities in the equation as well as a calculator to determine an unknown quantity in the equation. It also has animations depicting each of the assumptions in the kinetic molecular theory."
        self.view.addSubview(assumptions)
        
        assumptions.center.x = self.view.center.x
        assumptions.textColor = GlobalConstants.offwhite
        assumptions.numberOfLines = 0
        assumptions.lineBreakMode = .byWordWrapping
        assumptions.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.035))
        assumptions.sizeToFit()
        
        let instructionsTitle = UILabel(frame: CGRect(x: 10, y: assumptions.frame.maxY + 10 , width: screenWidth - 20, height: 150))
        instructionsTitle.text = "How to use the App"
        instructionsTitle.textColor = GlobalConstants.offwhite
        instructionsTitle.textAlignment = .center
        
        self.view.addSubview(instructionsTitle)
        
        instructionsTitle.textColor = GlobalConstants.offwhite
        instructionsTitle.numberOfLines = 0
        instructionsTitle.lineBreakMode = .byWordWrapping
        instructionsTitle.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.055))
        instructionsTitle.sizeToFit()
         instructionsTitle.center.x = self.view.center.x

        
        
        
        
        
        let instructionsSubtitle1 = UILabel(frame: CGRect(x: 10, y: instructionsTitle.frame.maxY + 1 , width: screenWidth - 20, height: 150))
        instructionsSubtitle1.textColor = GlobalConstants.offwhite
        instructionsSubtitle1.textAlignment = .center
        instructionsSubtitle1.text = "Visualizer "
        self.view.addSubview(instructionsSubtitle1)
        
       instructionsSubtitle1.textColor = GlobalConstants.offwhite
       instructionsSubtitle1.numberOfLines = 0
       instructionsSubtitle1.lineBreakMode = .byWordWrapping
       instructionsSubtitle1.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.045))
       instructionsSubtitle1.sizeToFit()
        instructionsSubtitle1.center.x = self.view.center.x
        
        let instructionsDescription1 = UILabel(frame: CGRect(x: 10, y: instructionsSubtitle1.frame.maxY + 1 , width: screenWidth - 20, height: 150))
        instructionsDescription1.textColor = GlobalConstants.offwhite
        instructionsDescription1.textAlignment = .center
        instructionsDescription1.text = "Use the controls to choose two quantities to vary and two to keep constant. Use the sliders to change the variables to see how they affect one another. "
        self.view.addSubview(instructionsDescription1)
        
        instructionsDescription1.textColor = GlobalConstants.offwhite
        instructionsDescription1.numberOfLines = 0
        instructionsDescription1.lineBreakMode = .byWordWrapping
        instructionsDescription1.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.035))
       instructionsDescription1.sizeToFit()
        instructionsDescription1.center.x = self.view.center.x
        
        
        let instructionsSubtitle2 = UILabel(frame: CGRect(x: 10, y: instructionsDescription1.frame.maxY + 1 , width: screenWidth - 20, height: 150))
        instructionsSubtitle2.textColor = GlobalConstants.offwhite
        instructionsSubtitle2.textAlignment = .center
        instructionsSubtitle2.text = "Calculator "
        self.view.addSubview(instructionsSubtitle2)
        
        instructionsSubtitle2.textColor = GlobalConstants.offwhite
        instructionsSubtitle2.numberOfLines = 0
        instructionsSubtitle2.lineBreakMode = .byWordWrapping
        instructionsSubtitle2.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.045))
        instructionsSubtitle2.sizeToFit()
        instructionsSubtitle2.center.x = self.view.center.x
        
        let instructionsDescription2 = UILabel(frame: CGRect(x: 10, y: instructionsSubtitle2.frame.maxY + 1 , width: screenWidth - 20, height: 150))
        instructionsDescription2.textColor = GlobalConstants.offwhite
        instructionsDescription2.textAlignment = .center
        instructionsDescription2.text = "Click on the textbox to select a quantity to enter. Enter any three and the fourth one will be automatically calculated. "
        self.view.addSubview(instructionsDescription2)
        
        instructionsDescription2.textColor = GlobalConstants.offwhite
        instructionsDescription2.numberOfLines = 0
        instructionsDescription2.lineBreakMode = .byWordWrapping
        instructionsDescription2.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.035))
        instructionsDescription2.sizeToFit()
        instructionsDescription2.center.x = self.view.center.x
        
        let instructionsSubtitle3 = UILabel(frame: CGRect(x: 10, y: instructionsDescription2.frame.maxY + 1 , width: screenWidth - 20, height: 150))
        instructionsSubtitle3.textColor = GlobalConstants.offwhite
        instructionsSubtitle3.textAlignment = .center
        instructionsSubtitle3.text = "Kinetic Molecular Theory"
        self.view.addSubview(instructionsSubtitle3)
        
        instructionsSubtitle3.textColor = GlobalConstants.offwhite
        instructionsSubtitle3.numberOfLines = 0
        instructionsSubtitle3.lineBreakMode = .byWordWrapping
        instructionsSubtitle3.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.045))
        instructionsSubtitle3.sizeToFit()
        instructionsSubtitle3.center.x = self.view.center.x
        
        let instructionsDescription3 = UILabel(frame: CGRect(x: 10, y: instructionsSubtitle3.frame.maxY + 1 , width: screenWidth - 20, height: 150))
        instructionsDescription3.textColor = GlobalConstants.offwhite
        instructionsDescription3.textAlignment = .center
        instructionsDescription3.text = "Click through each of the buttons to learn more about each of the assumptions made. "
        self.view.addSubview(instructionsDescription3)
        
        instructionsDescription3.textColor = GlobalConstants.offwhite
        instructionsDescription3.numberOfLines = 0
        instructionsDescription3.lineBreakMode = .byWordWrapping
        instructionsDescription3.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.035))
        instructionsDescription3.sizeToFit()
        instructionsDescription3.center.x = self.view.center.x
        
        
        let authors = UILabel(frame: CGRect(x: 10, y: instructionsDescription3.frame.maxY + 10 , width: screenWidth - 20, height: 150))
        authors.textColor = GlobalConstants.offwhite
        authors.textAlignment = .center
        authors.text = "Ideal Gas, version 1.0. Copyright©2017 Chrysalis Innovations Corp. All rights reserved. App developed by Ryan Kim, Sabahat Hussain and Maliha Islam, Impact Centre, University of Toronto."
        self.view.addSubview(authors)
        
        authors.center.x = self.view.center.x
        authors.textColor = GlobalConstants.offwhite
        authors.numberOfLines = 0
        authors.lineBreakMode = .byWordWrapping
        authors.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.035))
        authors.sizeToFit()
        
        let attribution = UILabel(frame: CGRect(x: 10, y: authors.frame.maxY + 10 , width: screenWidth - 20, height: 75))
        attribution.textColor = GlobalConstants.offwhite
        attribution.textAlignment = .center
        attribution.text = "Attribution to Entypo Pictograms by Daniel Bruce — CC BY-SA 4.0. "
        self.view.addSubview(attribution)
        
        attribution.center.x = self.view.center.x
        attribution.textColor = GlobalConstants.offwhite
        attribution.numberOfLines = 0
        attribution.lineBreakMode = .byWordWrapping
        attribution.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.035))
        attribution.sizeToFit()

        
        let button = UIButton(frame: CGRect(x: 30, y: attribution.frame.maxY + 5, width: screenWidth/2 - 45 , height: 70))
        button.backgroundColor = GlobalConstants.pink
        button.layer.cornerRadius = 10
        button.layer.borderWidth = GlobalConstants.borderW
        button.layer.borderColor = GlobalConstants.pink.cgColor
        button.setTitleColor(GlobalConstants.darkpurple, for: .normal)
        button.setTitle("  More Apps  ", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "HelveticaNeue-Light", size :screenWidth*0.05)
        
        button.sizeToFit()
        button.center.x = self.view.center.x / 2
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)

        
        let buyButton = UIButton(frame: CGRect(x: screenWidth/2 + 15, y: attribution.frame.maxY + 5, width: screenWidth/2 - 45 , height: 70))
        buyButton.backgroundColor = GlobalConstants.pink
        buyButton.layer.cornerRadius = 10
        buyButton.layer.borderWidth = GlobalConstants.borderW
        buyButton.layer.borderColor = GlobalConstants.pink.cgColor
        buyButton.setTitleColor(GlobalConstants.darkpurple, for: .normal)
        buyButton.setTitle(" Buy Ad-free App ", for: .normal)
        buyButton.titleLabel?.font = UIFont.init(name: "HelveticaNeue-Light", size :screenWidth*0.05)
        
        buyButton.sizeToFit()
        buyButton.center.x = self.view.center.x * 1.5
        buyButton.addTarget(self, action: #selector(buyButtonAction), for: .touchUpInside)
        self.view.addSubview(buyButton)

        
        
        //self.addGradient()
    }
    
    
    func buttonAction(sender: UIButton!) {
        print("Button tapped")
        
        // [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewArtist?id=885902457"]];
        
        let url = URL(string: "https://itunes.apple.com/us/developer/chrysalis-innovations/id885902457")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
        
    }
    
    func buyButtonAction(sender: UIButton!) {
        print("Button tapped")
        
        // [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewArtist?id=885902457"]];
        
        let url = URL(string: "https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=1251508171")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
        
    }
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    //creates gradient between two specified colours
    func addGradient(){
        
        let gradient:CAGradientLayer = CAGradientLayer()
        gradient.frame.size = self.view.frame.size
        gradient.colors = [UIColor.black.withAlphaComponent(0.85).cgColor,UIColor.black.withAlphaComponent(0.65).cgColor] //Or any colors
        self.view.layer.insertSublayer(gradient, at: 0)
        
    }
    
}
