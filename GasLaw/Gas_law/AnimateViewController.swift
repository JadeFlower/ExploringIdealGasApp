
//  AnimateViewController.swift
//  KineticMolecularTheory
//
//  Created by SETSI on 2017-05-17.
//  Copyright © 2017 SETSI. All rights reserved.
//

import UIKit

import SpriteKit

class AnimateViewController: UIViewController {
    
    var  animationToRun = 1
    var currentPicture = 0;
    let tapRec = UITapGestureRecognizer()
    
    var paybackLabel : UILabel = UILabel() //6th button
    let push = UIPushBehavior()
    let square = UIView(frame: CGRect(x: 15, y: 15, width: 16, height: 16))
    
    //adding gravity to our app
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    
    //initialize the collision behavior
    var collision: UICollisionBehavior!
    var itemBehaviour: UIDynamicItemBehavior!
    
    //let lightGreen = UIColor(red: 17/255, green: 173/255, blue: 110/255, alpha: 1)
    //let darkGreen = UIColor(red: 39/255, green: 81/255, blue: 61/255, alpha: 1)
    
    var boxes = Array<UIView>()
    var paybackSlider : UISlider = UISlider()
    var vortex : UIFieldBehavior = {
        let vortex: UIFieldBehavior = UIFieldBehavior.dragField()
        vortex.region = UIRegion(radius: 500.0) // 8
        vortex.strength = 250 // 9
        return vortex
    }()
    
    //for trailing animation in second screen
    var outline = UIView()
    var outline2 = UIView()
    var outline3 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth = self.view.frame.size.width
        let screenHeight = self.view.frame.size.height
        vortex.position = CGPoint(x:screenWidth/2, y:screenHeight/2)
        
        
    }
    
    
    func drawAnimation (animateOp: Int) {//will load initial picture
        
        animationToRun=animateOp
        
        if animationToRun == 1 { // large billard balls, random motion
            
            //var boxes : Array<UIView> = (count:4, repeatedValue: nil)
            
            let boxes : Array<UIView> = [UIView(), UIView(), UIView(), UIView(), UIView(), UIView()
                , UIView() , UIView(), UIView(), UIView(), UIView(), UIView()]
            
            let screenWidth = self.view.frame.size.width
            let screenHeight = self.view.frame.size.height
            
            for box : UIView in boxes {
                box.frame = CGRect(x: CGFloat(arc4random_uniform(UInt32(screenWidth - 16))), y: CGFloat(arc4random_uniform(UInt32(screenHeight - 16))), width: 16, height: 16)
                box.backgroundColor = GlobalConstants.yellow
                //box.layer.borderColor = darkGreen.cgColor
                // box.layer.borderWidth = 1
                box.layer.cornerRadius = 8
                view.addSubview(box)
                
            }
            
            animator = UIDynamicAnimator(referenceView: view)
            gravity = UIGravityBehavior(items: boxes)
            
            animator.addBehavior(gravity)
            
            collision = UICollisionBehavior(items: boxes)
            collision.translatesReferenceBoundsIntoBoundary = true
            animator.addBehavior(collision)
            
            let push = UIPushBehavior(items: boxes, mode: .instantaneous)
            push.angle = 45 //-1.75
            push.magnitude = 5.5
            animator.addBehavior(push)
            
            let itemBehaviour = UIDynamicItemBehavior(items: boxes)
            itemBehaviour.elasticity = 1.0
            itemBehaviour.density = 0
            itemBehaviour.friction = 0
            itemBehaviour.resistance = 0
            animator.addBehavior(itemBehaviour)
            
           
            
        }
        if animationToRun == 2 { // move in straight line unless they hit container or other particles
            
            let screenWidth = self.view.frame.size.width
            let screenHeight = self.view.frame.size.height
            
            let square = UIView(frame: CGRect(x: screenWidth/4, y: 15, width: 20, height: 20))
            //initialize the fun gravity stuff
            square.backgroundColor = GlobalConstants.yellow
            square.layer.cornerRadius = 10
            view.addSubview(square)
            
            
            let barrier = UIView(frame: CGRect(x: screenWidth/2 - 2, y: 2, width: 4, height: screenHeight-4))
            barrier.center = CGPoint(x: screenWidth/2, y: screenHeight/2)
            barrier.backgroundColor = GlobalConstants.offwhite
            //barrier.center.x = self.view.center.x
            view.addSubview(barrier)
            
            let square2 = UIView(frame: CGRect(x: screenWidth/2 + 20, y: 105, width: 20, height: 20))
            square2.backgroundColor = GlobalConstants.yellow
            square2.layer.cornerRadius = 10
            view.addSubview(square2)
            
            let square3 = UIView(frame: CGRect(x: screenWidth/2 + 50, y: 15, width: 20, height: 20))
            square3.backgroundColor = GlobalConstants.yellow
            square3.layer.cornerRadius = 10
            self.view.addSubview(square3)
            
            animator = UIDynamicAnimator(referenceView: view)
            gravity = UIGravityBehavior(items: [square, square2, square3 ])
            animator.addBehavior(gravity)
            
            collision = UICollisionBehavior(items: [square, square2, square3 ])
            collision.translatesReferenceBoundsIntoBoundary = true
            collision.addBoundary(withIdentifier : "barrier" as NSCopying , for : UIBezierPath(rect: barrier.frame))//
            animator.addBehavior(collision)
            
            var updateCount = 0
            
            collision.action = {
                if (updateCount % 3 == 0) {
                    self.outline = UIView(frame: square.bounds)
                    self.outline.transform = square.transform
                    self.outline.layer.cornerRadius = 10
                    self.outline.center = square.center
                    
                    self.outline.alpha = 0.5
                    self.outline.backgroundColor = UIColor.clear
                    self.outline.layer.borderColor = GlobalConstants.yellow.cgColor
                    self.outline.layer.borderWidth = 1.0
                    self.view.addSubview(self.outline)
                    
                    self.outline2 = UIView(frame: square2.bounds)
                    self.outline2.transform = square2.transform
                    self.outline2.layer.cornerRadius = 10
                    self.outline2.center = square2.center
                    
                    self.outline2.alpha = 0.5
                    self.outline2.backgroundColor = UIColor.clear
                    self.outline2.layer.borderColor = GlobalConstants.yellow.cgColor
                    self.outline2.layer.borderWidth = 1.0
                    self.view.addSubview(self.outline2)
                    
                    self.outline3 = UIView(frame: square3.bounds)
                    self.outline3.transform = square3.transform
                    self.outline3.layer.cornerRadius = 10
                    self.outline3.center = square3.center
                    
                    self.outline3.alpha = 0.5
                    self.outline3.backgroundColor = UIColor.clear
                    self.outline3.layer.borderColor = GlobalConstants.yellow.cgColor
                    self.outline3.layer.borderWidth = 1.0
                    self.view.addSubview(self.outline3)
                    
                    
                    UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                        self.outline.alpha = 0.0
                        self.outline2.alpha = 0.0
                        self.outline3.alpha = 0.0
                       // print("trailing effect")
                        
                    }, completion: {
                        (finished: Bool) -> Void in
                        self.outline.removeFromSuperview()
                        self.outline2.removeFromSuperview()
                        self.outline3.removeFromSuperview()
                    })
                     
                    
                }
               
                updateCount += updateCount
            }
            
            let push = UIPushBehavior(items: [square], mode: .instantaneous)
            push.angle = 3.1415/2
            push.magnitude = 5
            animator.addBehavior(push)
            
            let push2 = UIPushBehavior(items: [ square2, square3], mode: .instantaneous)
            push2.angle = 45 //-1.75
            push2.magnitude = 7
            animator.addBehavior(push2)
            
            let itemBehaviour = UIDynamicItemBehavior(items: [square, square2, square3])
            itemBehaviour.elasticity = 1.0
            itemBehaviour.density = 0
            itemBehaviour.friction = 0
            itemBehaviour.resistance = 0
            animator.addBehavior(itemBehaviour)
        }
        if animationToRun == 3 {// container is mostly empty space
            
            let screenWidth = self.view.frame.size.width
            let screenHeight = self.view.frame.size.height
            
            let smallBoxes : Array<UIView> = [UIView(), UIView(), UIView(), UIView()]
            
            for box : UIView in smallBoxes {
                box.frame = CGRect(x: CGFloat(arc4random_uniform(UInt32(screenWidth / 2 - 16))), y: CGFloat(arc4random_uniform(UInt32(screenHeight - 100))), width: 8, height: 8)
                box.backgroundColor = GlobalConstants.yellow
                box.layer.cornerRadius = 4
                view.addSubview(box)
                
            }
            
            let bigBoxes : Array<UIView> = [UIView(), UIView(), UIView(), UIView()]
            
            for box : UIView in bigBoxes {
                box.frame = CGRect(x: CGFloat(arc4random_uniform(UInt32(screenWidth / 2 - 10)) + UInt32(screenWidth/2 - 10)), y: CGFloat(arc4random_uniform(UInt32(screenHeight - 100))), width: screenWidth*0.1, height: screenWidth*0.1)
                box.backgroundColor = GlobalConstants.yellow
                box.layer.cornerRadius = screenWidth*0.05
                view.addSubview(box)
                
            }
            
            let barrier = UIView(frame: CGRect(x: 15, y: 2, width: 4, height: screenHeight-4))
            barrier.center = CGPoint(x: screenWidth/2, y: screenHeight/2)
            barrier.backgroundColor = GlobalConstants.offwhite
            view.addSubview(barrier)
            
            let boxes = smallBoxes + bigBoxes
            
            animator = UIDynamicAnimator(referenceView: view)
            gravity = UIGravityBehavior(items: boxes)
            animator.addBehavior(gravity)
            
            collision = UICollisionBehavior(items: boxes)
            collision.translatesReferenceBoundsIntoBoundary = true
            collision.addBoundary(withIdentifier : "barrier" as NSCopying , for : UIBezierPath(rect: barrier.frame))//
            animator.addBehavior(collision)
            
            let push = UIPushBehavior(items: boxes, mode: .instantaneous)
            push.angle = 35 //-1.75
            push.magnitude = 5.5
            animator.addBehavior(push)
            
            let itemBehaviour = UIDynamicItemBehavior(items: boxes)
            itemBehaviour.elasticity = 1.0
            itemBehaviour.density = 0
            itemBehaviour.friction = 0
            itemBehaviour.resistance = 0
            animator.addBehavior(itemBehaviour)
            
            let label = UILabel(frame: CGRect(x: CGFloat(3),y: CGFloat(screenHeight - 50) , width: CGFloat(screenWidth/2 - 6), height: CGFloat(50)))
            label.text = "Distance between particles are large in an ideal gas"
            label.textAlignment = .center
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.font = label.font.withSize(screenWidth * 0.04)
            label.textColor = GlobalConstants.offwhite
            view.addSubview(label)
            
            
            let label2 = UILabel(frame: CGRect(x: CGFloat(screenWidth/2 + 3),y: CGFloat(screenHeight - 50) , width: CGFloat(screenWidth/2 - 6), height: CGFloat(50)))
            label2.text = "Distance between particles are small in an non ideal gas"
            label2.font = label2.font.withSize(screenWidth * 0.04)
            label2.textAlignment = .center
            label2.numberOfLines = 0
            label2.lineBreakMode = .byWordWrapping
            label2.textColor = GlobalConstants.offwhite
            view.addSubview(label2)
            
            collision.addBoundary(withIdentifier : "label" as NSCopying , for : UIBezierPath(rect: label.frame))//
            collision.addBoundary(withIdentifier : "label2" as NSCopying , for : UIBezierPath(rect: label2.frame))//
            
            
            var checkMark :UIImageView
            checkMark = UIImageView(frame:CGRect(x: screenWidth/2 - screenWidth*0.10 - 10 ,y: 5,width: screenWidth*0.10 ,height: screenHeight*0.10));
            checkMark.image = UIImage(named:"check3.png")
            checkMark.contentMode = UIViewContentMode.scaleAspectFit
            self.view.addSubview(checkMark)
            
            var crossMark :UIImageView
            crossMark = UIImageView(frame:CGRect(x: screenWidth - screenWidth*0.10,y: 5,width: screenWidth*0.10 ,height: screenHeight*0.10));
            crossMark.image = UIImage(named:"cross.png")
            crossMark.contentMode = UIViewContentMode.scaleAspectFit
            self.view.addSubview(crossMark)
            
        }
        if animationToRun == 4 {// no interactive force between the particles
            //https://stackoverflow.com/questions/27660540/uiview-animatewithduration-swift-loop-animation
            
            let screenWidth = self.view.frame.size.width
            let screenHeight = self.view.frame.size.height
            
            let square = UIView(frame: CGRect(x: screenWidth / 6, y: 15, width: 20, height: 20))
            //initialize the fun gravity stuff
            square.backgroundColor = GlobalConstants.yellow
            square.layer.cornerRadius = 10
            view.addSubview(square)
            
            let square2 = UIView(frame: CGRect(x: screenWidth / 3, y: 135, width: 20, height: 20))
            square2.backgroundColor = GlobalConstants.yellow
            square2.layer.cornerRadius = 10
            view.addSubview(square2)
            
            let barrier = UIView(frame: CGRect(x: 15, y: 2, width: 4, height: screenHeight-4))
            barrier.center = CGPoint(x: screenWidth/2, y: screenHeight/2)
            barrier.backgroundColor = GlobalConstants.offwhite
            view.addSubview(barrier)
            
            //will not be perfectly inelastic
            let square3 = UIView(frame: CGRect(x: screenWidth * (2/3), y: 5, width: 20, height: 20))
            //initialize the fun gravity stuff
            square3.backgroundColor = GlobalConstants.yellow
            square3.layer.cornerRadius = 10
            self.view.addSubview(square3)
            
            let square4 = UIView(frame: CGRect(x: screenWidth * (5/6), y: screenHeight-77, width: 20, height: 20))
            square4.backgroundColor = GlobalConstants.yellow
            square4.layer.cornerRadius = 10
            self.view.addSubview(square4)
            
            animator = UIDynamicAnimator(referenceView: view)
            gravity = UIGravityBehavior(items: [square, square2, square3, square4 ])
            animator.addBehavior(gravity)
            
            collision = UICollisionBehavior(items: [square, square2, square3, square4 ])
            collision.translatesReferenceBoundsIntoBoundary = true
            collision.addBoundary(withIdentifier : "barrier" as NSCopying , for : UIBezierPath(rect: barrier.frame))//
            animator.addBehavior(collision)
            
            
            let push = UIPushBehavior(items: [square, square2, square3, square4], mode: .instantaneous)
            push.angle = 3.1415/2 //-1.75
            push.magnitude = 5
            animator.addBehavior(push)
            
            let itemBehaviour = UIDynamicItemBehavior(items: [square, square2, square3, square4])
            itemBehaviour.elasticity = 1.0
            itemBehaviour.density = 0
            itemBehaviour.friction = 0
            itemBehaviour.resistance = 0
            animator.addBehavior(itemBehaviour)
            
            
            let point = CGPoint(x: screenWidth * 0.7,y :screenHeight/2)
            
            let radialGravity: UIFieldBehavior = {
                let radialGravity: UIFieldBehavior = UIFieldBehavior.radialGravityField(position: point) // 1
                radialGravity.region = UIRegion(radius: screenWidth/2) // 2
                radialGravity.strength = 0.075 // 3
                radialGravity.falloff = 1.0 // 4
                radialGravity.minimumRadius = 750.0 // 5
                return radialGravity
            }()
            
            animator.addBehavior(radialGravity)
            radialGravity.addItem(square3)
            radialGravity.addItem(square4)
            
            /*var vortex: UIFieldBehavior = {
             let vortex: UIFieldBehavior = UIFieldBehavior.turbulenceField(smoothness: 0.05, animationSpeed: 0.05) // 6
             vortex.position = point // 7
             vortex.region = UIRegion(radius: 100.0) // 8
             vortex.strength = 2 // 9
             return vortex
             }()
             animator.addBehavior(vortex)
             vortex.addItem(square3)
             vortex.addItem(square4)*/
            
            
            let label = UILabel(frame: CGRect(x: CGFloat(3),y: CGFloat(screenHeight - 50) , width: CGFloat(screenWidth/2 - 6), height: CGFloat(50)))
            label.text = "No Interactive Force Between Particles"
            label.textAlignment = .center
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.font = label.font.withSize(screenWidth * 0.04)
            label.textColor = GlobalConstants.offwhite
            view.addSubview(label)
            
            
            let label2 = UILabel(frame: CGRect(x: CGFloat(screenWidth/2 + 3),y: CGFloat(screenHeight - 50) , width: CGFloat(screenWidth/2 - 6), height: CGFloat(50)))
            label2.text = "Interactive Force Between Particles"
            label2.font = label2.font.withSize(screenWidth * 0.04)
            label2.textAlignment = .center
            label2.numberOfLines = 0
            label2.lineBreakMode = .byWordWrapping
            label2.textColor = GlobalConstants.offwhite
            
            view.addSubview(label2)
            
            collision.addBoundary(withIdentifier : "label" as NSCopying , for : UIBezierPath(rect: label.frame))//
            collision.addBoundary(withIdentifier : "label2" as NSCopying , for : UIBezierPath(rect: label2.frame))//
            
            
            var checkMark :UIImageView
            checkMark = UIImageView(frame:CGRect(x: screenWidth/2 - screenWidth*0.10 - 10 ,y: 5,width: screenWidth*0.10 ,height: screenHeight*0.10));
            checkMark.image = UIImage(named:"check3.png")
            checkMark.contentMode = UIViewContentMode.scaleAspectFit
            self.view.addSubview(checkMark)
            
            var crossMark :UIImageView
            crossMark = UIImageView(frame:CGRect(x: screenWidth - screenWidth*0.10,y: 5,width: screenWidth*0.10 ,height: screenHeight*0.10));
            crossMark.image = UIImage(named:"cross.png")
            crossMark.contentMode = UIViewContentMode.scaleAspectFit
            self.view.addSubview(crossMark)
            
        }
        if animationToRun == 5 {//elastic collisions
            
            let screenWidth = self.view.frame.size.width
            let screenHeight = self.view.frame.size.height
            
            let square = UIView(frame: CGRect(x: 15, y: 15, width: 20, height: 20))
            //initialize the fun gravity stuff
            square.backgroundColor = GlobalConstants.yellow
            square.layer.cornerRadius = 10
            view.addSubview(square)
            
            let square2 = UIView(frame: CGRect(x: 55, y: 105, width: 20, height: 20))
            square2.backgroundColor = GlobalConstants.yellow
            square2.layer.cornerRadius = 10
            view.addSubview(square2)
            
            let barrier = UIView(frame: CGRect(x: screenWidth-2, y: 2, width: 4, height: screenHeight-4))
            barrier.center = CGPoint(x: screenWidth/2, y: screenHeight/2)
            barrier.backgroundColor = GlobalConstants.offwhite
            view.addSubview(barrier)
            
            //will not be perfectly inelastic
            let square3 = UIView(frame: CGRect(x: screenWidth/2 + 30, y: 15, width: 20, height: 20))
            //initialize the fun gravity stuff
            square3.backgroundColor = GlobalConstants.yellow
            square3.layer.cornerRadius = 10
            self.view.addSubview(square3)
            
            let square4 = UIView(frame: CGRect(x: screenWidth/2 + 50, y: 125, width: 20, height: 20))
            square4.backgroundColor = GlobalConstants.yellow
            square4.layer.cornerRadius = 10
            self.view.addSubview(square4)
            
            animator = UIDynamicAnimator(referenceView: view)
            gravity = UIGravityBehavior(items: [square, square2, square3, square4 ])
            animator.addBehavior(gravity)
            
            collision = UICollisionBehavior(items: [square, square2, square3, square4 ])
            collision.translatesReferenceBoundsIntoBoundary = true
            collision.addBoundary(withIdentifier : "barrier" as NSCopying , for : UIBezierPath(rect: barrier.frame))//
            animator.addBehavior(collision)
            
            
            let push = UIPushBehavior(items: [square, square2, square3, square4], mode: .instantaneous)
            push.angle = 45 //-1.75
            push.magnitude = 7.5
            animator.addBehavior(push)
            
            let itemBehaviour = UIDynamicItemBehavior(items: [square, square2])
            itemBehaviour.elasticity = 1.0
            itemBehaviour.density = 0
            itemBehaviour.friction = 0
            itemBehaviour.resistance = 0
            animator.addBehavior(itemBehaviour)
            
            let itemBehaviourInelastic = UIDynamicItemBehavior(items: [square3, square4])
            itemBehaviourInelastic.elasticity = 0.85
            itemBehaviourInelastic.density = 0
            itemBehaviourInelastic.friction = 0.01
            itemBehaviourInelastic.resistance = 0.01
            animator.addBehavior(itemBehaviourInelastic)
            
            let label = UILabel(frame: CGRect(x: CGFloat(3),y: CGFloat(screenHeight - 50) , width: CGFloat(screenWidth/2 - 6), height: CGFloat(50)))
            label.text = "Elastic Collision"
            label.textAlignment = .center
            label.lineBreakMode = .byWordWrapping
            label.font = label.font.withSize(screenWidth * 0.04)
            label.textColor = GlobalConstants.offwhite
            view.addSubview(label)
            
            
            let label2 = UILabel(frame: CGRect(x: CGFloat(screenWidth/2 + 3),y: CGFloat(screenHeight - 50) , width: CGFloat(screenWidth/2 - 6), height: CGFloat(50)))
            label2.text = "Not an Elastic Collision"
            label2.font = label2.font.withSize(screenWidth * 0.04)
            label2.textAlignment = .center
            label2.lineBreakMode = .byWordWrapping
            label2.textColor = GlobalConstants.offwhite
            
            view.addSubview(label2)
            
            collision.addBoundary(withIdentifier : "label" as NSCopying , for : UIBezierPath(rect: label.frame))//
            collision.addBoundary(withIdentifier : "label2" as NSCopying , for : UIBezierPath(rect: label2.frame))//
            
            
            var checkMark :UIImageView
            checkMark = UIImageView(frame:CGRect(x: screenWidth/2 - screenWidth*0.10 - 10 ,y: 5,width: screenWidth*0.10 ,height: screenHeight*0.10));
            checkMark.image = UIImage(named:"check3.png")
            checkMark.contentMode = UIViewContentMode.scaleAspectFit
            self.view.addSubview(checkMark)
            
            var crossMark :UIImageView
            crossMark = UIImageView(frame:CGRect(x: screenWidth - screenWidth*0.10,y: 5,width: screenWidth*0.10 ,height: screenHeight*0.10));
            crossMark.image = UIImage(named:"cross.png")
            crossMark.contentMode = UIViewContentMode.scaleAspectFit
            self.view.addSubview(crossMark)
            
        }
        if animationToRun == 6 {// average kinetic energy is a function of temp
            
            
            let screenWidth = self.view.frame.size.width
            let screenHeight = self.view.frame.size.height
            self.view = SKView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
            
            
            let scene = TemperatureAnimation(size: view.bounds.size)
            let skView = self.view as! SKView
            skView.ignoresSiblingOrder = true
            skView.allowsTransparency = true
            scene.scaleMode = .resizeFill
            scene.backgroundColor = UIColor.clear
            skView.presentScene(scene)
            
            
            
        }
        
    }
    
    func sliderValueDidChange(sender: UISlider!)
    {
        print("payback value: \(sender.value)")
        
        //push.active = false
        //self.gravity.gravityDirection = CGVector(dx: 0, dy: CGFloat(-1 * self.paybackSlider.value))
        //self.itemBehaviour.resistance = CGFloat(self.paybackSlider.value)
        //self.gravity.magnitude = CGFloat(-1 * self.paybackSlider.value)
        self.vortex.strength = CGFloat(self.paybackSlider.value)
        print ("strength is \(self.vortex.strength)")
        
    }
    
    func drawPicture () { // will draw subsequent pictures based on user tap. No longer need this
        
        if animationToRun == 1 { // large billard balls, random motion
        }
        if animationToRun == 2 { // move in straight line unless they hit container or other particles
        }
        if animationToRun == 3 {// container is mostly empty space
        }
        if animationToRun == 4 {// no interactive force between the particles
        }
        if animationToRun == 5 {//elastic collisions
        }
        if animationToRun == 6 {// average kinetic energy is a function of temp
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
