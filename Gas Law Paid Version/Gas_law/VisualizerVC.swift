//
//  SecondViewController.swift
//  Gas_law
//
//  Created by John Lennon on 2017-05-15.
//  Copyright © 2017 ImpactCenter. All rights reserved.
//
import AVFoundation
import Foundation
import UIKit
import AudioToolbox
class CustomNavigationViewController: UINavigationController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return UIInterfaceOrientation.portrait
    }
}
class VisualizerVC: UIViewController, UITabBarControllerDelegate {
    var truthcounter = 2
    var enablers = [true, true, false ,false]
    
    @IBOutlet var PSlider: UISlider!
    @IBOutlet var VSlider: UISlider!
    @IBOutlet var TSlider: UISlider!
    @IBOutlet var MSlider: UISlider!
    @IBOutlet var Psegcont: UISegmentedControl!
    @IBOutlet var Vsegcont: UISegmentedControl!
    @IBOutlet var Tsegcont: UISegmentedControl!
    @IBOutlet var Msegcont: UISegmentedControl!
    @IBOutlet var Mol1: UIImageView!
    @IBOutlet var Mol2: UIImageView!
    @IBOutlet var Mol3: UIImageView!
    @IBOutlet var Mol4: UIImageView!
    @IBOutlet var Mol5: UIImageView!
    @IBOutlet var Mol6: UIImageView!
    @IBOutlet var Mol7: UIImageView!
    @IBOutlet var Mol8: UIImageView!
    @IBOutlet var Mol9: UIImageView!
    @IBOutlet var Mol10: UIImageView!
    @IBOutlet var PressureMac: UIImageView!
    @IBOutlet var VisualizerLabel: UILabel!
    @IBOutlet var PlateScale: UIImageView!
    @IBOutlet var Needleimage: UIImageView!
    @IBOutlet var TempGauge: UIImageView!
    @IBOutlet var TempPSI: UIImageView!
    @IBOutlet var PressureLabel: UILabel!
    @IBOutlet var VolumnLabel: UILabel!
    @IBOutlet var TemperatureLabel: UILabel!
    @IBOutlet var MolLabel: UILabel!
    @IBOutlet var subtitle: UILabel!
    
    var freeSpacing:CGFloat = 0
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let iphone7pluswidth = CGFloat(375)
        
        
        //VisualizerLabel.font = VisualizerLabel.font.withSize(CGFloat(32) * (screenWidth/iphone7pluswidth))
        VisualizerLabel.font = VisualizerLabel.font.withSize(screenWidth*0.075)
        VisualizerLabel.sizeToFit()
        VisualizerLabel.frame.origin.x = screenWidth/2 - VisualizerLabel.frame.width/2
        VisualizerLabel.frame.origin.y = 15 + freeSpacing
        
        subtitle.font = UIFont.init(name: "HelveticaNeue-Light",size:CGFloat(17) * (screenWidth/iphone7pluswidth))
        subtitle.textColor = GlobalConstants.darkpurple
        subtitle.frame.size.width = VisualizerLabel.frame.width
        subtitle.sizeToFit()
        subtitle.frame.origin.y = VisualizerLabel.frame.maxY + 15
        subtitle.frame.origin.x = screenWidth/2 - subtitle.frame.width/2
        
        PressureLabel.font = PressureLabel.font.withSize(CGFloat(17) * (screenWidth/iphone7pluswidth))
        VolumnLabel.font = VolumnLabel.font.withSize(CGFloat(17) * (screenWidth/iphone7pluswidth))
        TemperatureLabel.font = TemperatureLabel.font.withSize(CGFloat(17) * (screenWidth/iphone7pluswidth))
        MolLabel.font = MolLabel.font.withSize(CGFloat(17) * (screenWidth/iphone7pluswidth))
        
        PressureLabel.sizeToFit()
        VolumnLabel.sizeToFit()
        TemperatureLabel.sizeToFit()
        MolLabel.sizeToFit()
        
        PressureLabel.frame.origin.y = subtitle.frame.maxY + 15
        VolumnLabel.frame.origin.y = PressureLabel.frame.maxY + 15
        TemperatureLabel.frame.origin.y = VolumnLabel.frame.maxY + 15
        MolLabel.frame.origin.y = TemperatureLabel.frame.maxY + 15
        //sliders change size if wider device is used and vice versa
        if (screenWidth/10 > 100){
            Psegcont.setWidth(screenWidth/10, forSegmentAt: 0)
            Psegcont.setWidth(screenWidth/10, forSegmentAt: 1)
            Psegcont.frame.size.width = screenWidth / 5
            Vsegcont.setWidth(screenWidth/10, forSegmentAt: 0)
            Vsegcont.setWidth(screenWidth/10, forSegmentAt: 1)
            Vsegcont.frame.size.width = screenWidth / 5
            Tsegcont.setWidth(screenWidth/10, forSegmentAt: 0)
            Tsegcont.setWidth(screenWidth/10, forSegmentAt: 1)
            Tsegcont.frame.size.width = screenWidth / 5
            Msegcont.setWidth(screenWidth/10, forSegmentAt: 0)
            Msegcont.setWidth(screenWidth/10, forSegmentAt: 1)
            Msegcont.frame.size.width = screenWidth / 5
        }
        
        Psegcont.frame.origin.x = screenWidth - Psegcont.frame.width - 10
        Vsegcont.frame.origin.x = Psegcont.frame.origin.x
        Tsegcont.frame.origin.x = Psegcont.frame.origin.x
        Msegcont.frame.origin.x = Psegcont.frame.origin.x
        
        PSlider.frame.origin.x = TemperatureLabel.frame.maxX + 2
        VSlider.frame.origin.x = TemperatureLabel.frame.maxX + 2
        TSlider.frame.origin.x = TemperatureLabel.frame.maxX + 2
        MSlider.frame.origin.x = TemperatureLabel.frame.maxX + 2
        
        PSlider.frame.size.width = screenWidth - Psegcont.frame.width - 15 - 15 - TemperatureLabel.frame.size.width - 2
        MSlider.frame.size.width = PSlider.frame.width
        VSlider.frame.size.width = PSlider.frame.width
        TSlider.frame.size.width = PSlider.frame.width
        
        PSlider.frame.origin.y = PressureLabel.frame.origin.y + PressureLabel.frame.height / 2 - PSlider.frame.height / 2
        VSlider.frame.origin.y = VolumnLabel.frame.origin.y + VolumnLabel.frame.height / 2 - VSlider.frame.height / 2
        TSlider.frame.origin.y = TemperatureLabel.frame.origin.y + TemperatureLabel.frame.height / 2 - TSlider.frame.height / 2
        MSlider.frame.origin.y = MolLabel.frame.origin.y + MolLabel.frame.height / 2 - MSlider.frame.height / 2
        
        
        //segments are placed right side of sliders always
        
        Psegcont.frame.origin.y = PSlider.frame.origin.y + 1
        Vsegcont.frame.origin.y = VSlider.frame.origin.y + 1
        Tsegcont.frame.origin.y = TSlider.frame.origin.y + 1
        Msegcont.frame.origin.y = MSlider.frame.origin.y + 1
        
        PressureMac.frame.origin.y = MolLabel.frame.maxY + 20
        PressureMac.frame.size.width = screenWidth/2 - 30
        PressureMac.frame.origin.x = screenWidth/4 - PressureMac.frame.width/2
        var bottommargin = CGFloat(100)
        
            PressureMac.frame.size.height = screenHeight - PressureMac.frame.origin.y - 50
            bottommargin = 50
        
        TempPSI.frame.origin.y = PressureMac.frame.origin.y
        TempPSI.frame.size.width = screenWidth/2 - 30
        TempPSI.frame.origin.x = screenWidth/4 * 3 - TempPSI.frame.width/2
        TempPSI.frame.size.height = PressureMac.frame.height
        
        //make sure the image is always proportionate to make sure updating it is going to be easier and conssitant in looks
        if (TempPSI.frame.maxX > screenWidth){
            TempPSI.frame.size.width = TempPSI.frame.height/2
            TempPSI.frame.origin.x = screenWidth/4 * 3 - TempPSI.frame.width/2
            
        } else if (TempPSI.frame.height > TempPSI.frame.width*2) && (TempPSI.frame.maxY < (screenHeight - bottommargin)) {
            
            TempPSI.frame.size.height = TempPSI.frame.width*2
            
            let Poriginal = PressureMac.frame.origin.y
            PressureMac.frame.size.height = TempPSI.frame.height
            PressureMac.frame.origin.y = Poriginal
            TempPSI.frame.origin.y = Poriginal
            TempPSI.frame.origin.x = screenWidth/4 * 3 - TempPSI.frame.width/2
            
        } else {
            TempPSI.frame.size.width = TempPSI.frame.height/2
            TempPSI.frame.origin.x = screenWidth/4 * 3 - TempPSI.frame.width/2
            
        }
        
        PlateScale.frame.origin.y = PressureMac.frame.origin.y
        PlateScale.frame.size.width = PressureMac.frame.width
        PlateScale.frame.origin.x = PressureMac.frame.origin.x
        PlateScale.frame.size.height = PressureMac.frame.height * 0.75
        
        Needleimage.frame.size.height = TempPSI.frame.height*0.5
        Needleimage.frame.size.width = TempPSI.frame.width
        Needleimage.frame.origin.y = TempPSI.frame.origin.y
        Needleimage.frame.origin.x = TempPSI.frame.origin.x + 1
        
        TempGauge.frame.size.height = TempPSI.frame.height/2 * 0.57
        TempGauge.frame.origin.y = TempPSI.frame.origin.y + TempPSI.frame.height/2 + TempPSI.frame.height*0.08
        TempGauge.frame.size.width = TempPSI.frame.width * 0.05
        TempGauge.frame.origin.x = TempPSI.frame.origin.x + TempPSI.frame.width/2 - TempGauge.frame.width/2
        
        Mol1.frame.size.width = PressureMac.frame.width/16
        Mol1.frame.size.height = PressureMac.frame.height*0.02
        Mol2.frame.size.width = PressureMac.frame.width/16
        Mol2.frame.size.height = PressureMac.frame.height*0.02
        Mol3.frame.size.width = PressureMac.frame.width/16
        Mol3.frame.size.height = PressureMac.frame.height*0.02
        Mol4.frame.size.width = PressureMac.frame.width/16
        Mol4.frame.size.height = PressureMac.frame.height*0.02
        Mol5.frame.size.width = PressureMac.frame.width/16
        Mol5.frame.size.height = PressureMac.frame.height*0.02
        Mol6.frame.size.width = PressureMac.frame.width/16
        Mol6.frame.size.height = PressureMac.frame.height*0.02
        Mol7.frame.size.width = PressureMac.frame.width/16
        Mol7.frame.size.height = PressureMac.frame.height*0.02
        Mol8.frame.size.width = PressureMac.frame.width/16
        Mol8.frame.size.height = PressureMac.frame.height*0.02
        Mol9.frame.size.width = PressureMac.frame.width/16
        Mol9.frame.size.height = PressureMac.frame.height*0.02
        Mol10.frame.size.width = PressureMac.frame.width/16
        Mol10.frame.size.height = PressureMac.frame.height*0.02
        
        
        //bottom anchor for the temperature bar
        original_y_t =  TempGauge.frame.maxY
        
        PSlider.isEnabled = enablers[0]
        VSlider.isEnabled = enablers[1]
        TSlider.isEnabled = enablers[2]
        MSlider.isEnabled = enablers[3]
        update_Sliders()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Can now access UITabBar
        self.tabBarController?.delegate = self
        
    }

    
    //used for playng clicing sounds between the two tabs
    var pathTab = Bundle.main.path(forResource: "sound15.wav", ofType:nil)!
    var clickseTab: AVAudioPlayer!
    func playclicksoundTab(){
        let urlTab = URL(fileURLWithPath: pathTab)
        do {
            let soundTab = try AVAudioPlayer(contentsOf: urlTab)
            clickseTab = soundTab
            soundTab.play()
        } catch {
            //print("Failed")
            // couldn't load file :(
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        /*let tabBarIndex = tabBarController.selectedIndex
        if tabBarIndex == 0 {
            //do your stuff
        }*/
        print("gg")
        playclicksoundTab()
    }
    
    //used for playng clicing souns
    var path = Bundle.main.path(forResource: "soundvar.caf", ofType:nil)!
    var clickse: AVAudioPlayer!
    func playclicksound(){
        let url = URL(fileURLWithPath: path)
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            clickse = sound
            clickse.volume = 0.5
            //sound.prepareToPlay()
            sound.play()
        } catch {
            //print("Failed")
            // couldn't load file :(
        }
    }
    
    //usefunction enableslider whe one of segment is selcted
    @IBAction func PChange(_ sender: UISegmentedControl) {
        enableslider(segementcontrol: Psegcont, enabler: &enablers[0])
    }
    @IBAction func VChange(_ sender: UISegmentedControl) {
        enableslider(segementcontrol: Vsegcont, enabler: &enablers[1])
    }
    @IBAction func TChange(_ sender: UISegmentedControl) {
        enableslider(segementcontrol: Tsegcont, enabler: &enablers[2])
    }
    @IBAction func MChange(_ sender: UISegmentedControl) {
        enableslider(segementcontrol: Msegcont, enabler: &enablers[3])
    }
    
    //sliders do not use proper calculation. it roughply shows relations between two variables
    @IBAction func PSliderChange(_ sender: UISlider) {
        if (MSlider.isEnabled == true){
            MSlider.value = PSlider.value
        } else if (TSlider.isEnabled == true){
            TSlider.value = PSlider.value
        } else if (VSlider.isEnabled == true){
            VSlider.value = VSlider.maximumValue - PSlider.value
        }
        update_Sliders()
        
    }
    @IBAction func VSliderChange(_ sender: UISlider) {
        if (MSlider.isEnabled == true){
            MSlider.value = VSlider.value
        } else if (TSlider.isEnabled == true){
            TSlider.value = VSlider.value
        } else if (PSlider.isEnabled == true){
            PSlider.value = PSlider.maximumValue - VSlider.value
        }
        update_Sliders()
        
    }
    
    @IBAction func TSliderChange(_ sender: UISlider) {
        if (VSlider.isEnabled == true){
            VSlider.value = TSlider.value
        } else if (PSlider.isEnabled == true){
            PSlider.value = TSlider.value
        } else if (MSlider.isEnabled == true){
            MSlider.value = MSlider.maximumValue - TSlider.value
        }
        update_Sliders()
        
    }
    
    @IBAction func MSliderChange(_ sender: UISlider) {
        if (VSlider.isEnabled == true){
            VSlider.value = MSlider.value
        } else if (PSlider.isEnabled == true){
            PSlider.value = MSlider.value
        } else if (MSlider.isEnabled == true){
            TSlider.value = TSlider.maximumValue - MSlider.value
        }
        update_Sliders()
        
    }
    
    var original_y_t: CGFloat = 0.0
    
    func enableslider (segementcontrol:UISegmentedControl, enabler: inout Bool){
        //when someone changes segment control, reset values for all and checkif there are only 2 variabes and constraints checked
        
        PSlider.value = 5
        VSlider.value = 5
        TSlider.value = 5
        MSlider.value = 5
        
        //check if th current segment is set to variabeor constant. if only 2 enabled, sliders will be enabled, if not then all sliders are disabled
        
        switch segementcontrol.selectedSegmentIndex
        {
        case 0:
            enabler = true;
            truthcounter = truthcounter + 1
            path = Bundle.main.path(forResource: "possound.wav", ofType:nil)!
        case 1:
            enabler = false;
            truthcounter = truthcounter - 1
            path = Bundle.main.path(forResource: "possound.wav", ofType:nil)!
        default:
            break;
        }
        playclicksound()
        
        //disableall sliders unless 2 are variable. change title at the top if certain values are selected
        if truthcounter != 2{
            if truthcounter == 0{
                subtitle.text = "Choose two parameters to vary"
            }else if truthcounter == 4{
                subtitle.text = "Choose two parameters to hold constant"
            } else {
                subtitle.text = "Choose two parameters to vary and two to hold constant"
            }
            PSlider.isEnabled = false
            VSlider.isEnabled = false
            TSlider.isEnabled = false
            MSlider.isEnabled = false
            VisualizerLabel.text = "Visualizer: Ideal Gas Law"
        } else {
            PSlider.isEnabled = enablers[0]
            VSlider.isEnabled = enablers[1]
            TSlider.isEnabled = enablers[2]
            MSlider.isEnabled = enablers[3]
            
            if (PSlider.isEnabled == true && VSlider.isEnabled == true){
                VisualizerLabel.text = "Visualizer: Boyle's Law"
                subtitle.text = "When n and T are constant, P and V are inversely proportional"
            }else if (VSlider.isEnabled == true && TSlider.isEnabled == true){
                VisualizerLabel.text = "Visualizer: Charles's Law"
                subtitle.text = "When P and n are constant, V and T are directly proportional"
            }else if (VSlider.isEnabled == true && MSlider.isEnabled == true){
                VisualizerLabel.text = "Visualizer: Avogadro's Law"
                subtitle.text = "When P and T are constant, V and n are directly proportional"
                
            }else if (PSlider.isEnabled == true && TSlider.isEnabled == true){
                VisualizerLabel.text = "Visualizer: Amontons's Law"
                subtitle.text = "When V and n are constant, P and T are directly proportional"
                
            } else {
                
                VisualizerLabel.text = "Visualizer: Ideal Gas Law"
                if (PSlider.isEnabled == true && MSlider.isEnabled == true){
                    subtitle.text = "When V and T are constant, P and n are directly proportional"
                }else  if (TSlider.isEnabled == true && MSlider.isEnabled == true){
                    subtitle.text = "When P and V are constant, T and n are inversely proportional"
                }
            }
        }
        update_Sliders()
        
    }
    func update_Sliders(){
        
        //update images according to the sliders
        
        //temperaure red bar is anchored onthe bottom and goes up and down by scaling y value
        TempGauge.transform = CGAffineTransform(scaleX: 1.0, y: CGFloat(TSlider.value/10))
        TempGauge.frame.origin.y = original_y_t - TempGauge.frame.height
        
        //plate is scaled downward
        PlateScale.transform = CGAffineTransform(scaleX: 1.0, y:CGFloat(1-VSlider.value/10.1))
        PlateScale.frame.origin.y = PressureMac.frame.origin.y
        
        //rotation of the needles
        Needleimage.transform = CGAffineTransform(rotationAngle: CGFloat(PSlider.value/10*Float.pi*1.5))
        
        //dictate if molecules appear and size of it
        MoleSize(values: 0, molenumb: Mol1)
        MoleSize(values: 1, molenumb: Mol2)
        MoleSize(values: 2, molenumb: Mol3)
        MoleSize(values: 3, molenumb: Mol4)
        MoleSize(values: 4, molenumb: Mol5)
        MoleSize(values: 5, molenumb: Mol6)
        MoleSize(values: 6, molenumb: Mol7)
        MoleSize(values: 7, molenumb: Mol8)
        MoleSize(values: 8, molenumb: Mol9)
        MoleSize(values: 9, molenumb: Mol10)
        
    }
    
    
    
    func MoleSize (values:Float,molenumb:UIImageView){
        //check if the value of slider is great enough for the molecule to appear
        
        if (MSlider.value > values){
            molenumb.isHidden = false
            
            //molecules will always appear below plate and above the bottom of the pressure machine
            let MaxYPlateFrame = PlateScale.frame.maxY
            let MaxYPressureMac = PressureMac.frame.maxY
            let XPressureMac = PressureMac.frame.origin.x
            let widthPress = PressureMac.frame.width
            
            //divide y axis into 3 dfferent rows for molecules to line up
            let changey = values.truncatingRemainder(dividingBy: 3)+1
            var newy = CGFloat(changey) * (MaxYPressureMac - MaxYPlateFrame - PressureMac.frame.height * 0.05) / 4
            newy = MaxYPlateFrame + newy
            
            //divide x axes into 4 different columes
            let xvalues = values / 3
            let changex = xvalues.rounded(.down)+1
            let newx =  XPressureMac + CGFloat(changex) * (widthPress) / 5 - molenumb.frame.width/2
            molenumb.frame.origin.x = newx
            molenumb.frame.origin.y = newy
            
            //change the scale according to sider axis
            var scaler = CGFloat(MSlider.value - values)
            if (scaler >= 1){
                scaler = 1
            }
            if scaler != 0{
                molenumb.transform = CGAffineTransform(scaleX:scaler, y:scaler)
            }
        } else{
            molenumb.isHidden = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

