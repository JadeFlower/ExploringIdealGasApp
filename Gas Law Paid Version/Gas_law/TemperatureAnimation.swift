//
//  TemperatureAnimation.swift
//  KineticMolecularTheory
//
//  Created by SETSI on 2017-05-24.
//  Copyright © 2017 SETSI. All rights reserved.
//

import SpriteKit

class TemperatureAnimation: SKScene {
    
    var ball = SKShapeNode()
    var ball2 = SKShapeNode()
    var ball3 = SKShapeNode()
    var ball4 = SKShapeNode()
    var ball5 = SKShapeNode()
    var ball6 = SKShapeNode()
    var ball7 = SKShapeNode()
    
    var balls : Array <SKShapeNode> = [SKShapeNode(), SKShapeNode(), SKShapeNode(), SKShapeNode(), SKShapeNode(), SKShapeNode() ]
    
    //let lightGreen = UIColor(red: 17/255, green: 173/255, blue: 110/255, alpha: 1)
    //let darkGreen = UIColor(red: 39/255, green: 81/255, blue: 61/255, alpha: 1)
    
    override func didMove(to view: SKView) {
        
        //backgroundColor = SKColor.white
        
        let borderBody = SKPhysicsBody(edgeLoopFrom: frame)
        borderBody.friction = 0
        physicsBody = borderBody
        
        let screenWidth = size.width
        let screenHeight = size.height
        
        /* for createBalls : SKShapeNode in balls {
         var createBalls = ballSprite(position: CGPoint(x: CGFloat(arc4random_uniform(UInt32(screenWidth - 100 ))), y: CGFloat(arc4random_uniform(UInt32(screenHeight - 100)))))
         addChild(createBalls)
         let force = SKAction.applyForce(CGVector(dx: CGFloat(arc4random_uniform(UInt32(50))), dy: 50) , duration: 0.1)
         createBalls.run(force)
         
         }*/
        
        let force = SKAction.applyForce(CGVector(dx: 51, dy: 49) , duration: 0.1)
        ball = ballSprite(position: CGPoint(x: CGFloat(arc4random_uniform(UInt32(screenWidth - 100 ))), y: CGFloat(arc4random_uniform(UInt32(screenHeight - 100)))))
        addChild(ball)
        ball.run(force)
        
        let force2 = SKAction.applyForce(CGVector(dx: 53, dy: 47) , duration: 0.1)
        ball2 = ballSprite(position: CGPoint(x: CGFloat(arc4random_uniform(UInt32(screenWidth - 100 ))), y: CGFloat(arc4random_uniform(UInt32(screenHeight - 100)))))
        addChild(ball2)
        ball2.run(force2)
        
        let force3 = SKAction.applyForce(CGVector(dx: 55, dy: 45) , duration: 0.1)
        ball3 = ballSprite(position: CGPoint(x: CGFloat(arc4random_uniform(UInt32(screenWidth - 100 ))), y: CGFloat(arc4random_uniform(UInt32(screenHeight - 100)))))
        addChild(ball3)
        ball3.run(force3)
        
        let force4 = SKAction.applyForce(CGVector(dx: 57, dy: 43) , duration: 0.1)
        ball4 = ballSprite(position: CGPoint(x: CGFloat(arc4random_uniform(UInt32(screenWidth - 100 ))), y: CGFloat(arc4random_uniform(UInt32(screenHeight - 100)))))
        addChild(ball4)
        ball4.run(force4)
        
        let force5 = SKAction.applyForce(CGVector(dx: 57, dy: 43) , duration: 0.1)
        ball5 = ballSprite(position: CGPoint(x: CGFloat(arc4random_uniform(UInt32(screenWidth - 100 ))), y: CGFloat(arc4random_uniform(UInt32(screenHeight - 100)))))
        addChild(ball5)
        ball5.run(force5)
        
        let force6 = SKAction.applyForce(CGVector(dx: 57, dy: 43) , duration: 0.1)
        ball6 = ballSprite(position: CGPoint(x: CGFloat(arc4random_uniform(UInt32(screenWidth - 100 ))), y: CGFloat(arc4random_uniform(UInt32(screenHeight - 100)))))
        addChild(ball6)
        ball6.run(force6)
        
        let force7 = SKAction.applyForce(CGVector(dx: 57, dy: 43) , duration: 0.1)
        ball7 = ballSprite(position: CGPoint(x: CGFloat(arc4random_uniform(UInt32(screenWidth - 100 ))), y: CGFloat(arc4random_uniform(UInt32(screenHeight - 100)))))
        addChild(ball7)
        ball7.run(force7)
        
        let paybackSlider = UISlider(frame: CGRect(x: 0 ,y: screenHeight - 40,width: screenWidth  ,height: 40))
        paybackSlider.minimumValue = 5
        paybackSlider.maximumValue = 75
        paybackSlider.isContinuous = true
        paybackSlider.tintColor = GlobalConstants.pink
        //paybackSlider.thumbTintColor =
        paybackSlider.value = 40
        paybackSlider.addTarget(self, action: #selector(TemperatureAnimation.sliderValueDidChange(sender:)), for: .valueChanged)
        
        view.addSubview(paybackSlider)
        
    }
    
    func sliderValueDidChange(sender: UISlider!)
    {
        print("payback value: \(sender.value)")
        
        
        /*let tempdx = (ball.physicsBody?.velocity.dy)! / (ball.physicsBody?.velocity.dx)!
         ball.physicsBody?.velocity.dx = CGFloat(sender.value)
         ball.physicsBody?.velocity.dy = (ball.physicsBody?.velocity.dx)! * tempdx
         
         let tempdx2 = (ball2.physicsBody?.velocity.dy)! / (ball2.physicsBody?.velocity.dx)!
         ball2.physicsBody?.velocity.dx = CGFloat(sender.value)
         ball2.physicsBody?.velocity.dy = (ball2.physicsBody?.velocity.dx)! * tempdx2
         
         let tempdx3 = (ball3.physicsBody?.velocity.dy)! / (ball3.physicsBody?.velocity.dx)!
         ball3.physicsBody?.velocity.dx = CGFloat(sender.value)
         ball3.physicsBody?.velocity.dy = (ball3.physicsBody?.velocity.dx)! * tempdx3
         
         let tempdx4 = (ball4.physicsBody?.velocity.dy)! / (ball4.physicsBody?.velocity.dx)!
         ball4.physicsBody?.velocity.dx = CGFloat(sender.value)
         ball4.physicsBody?.velocity.dy = (ball4.physicsBody?.velocity.dx)! * tempdx4
         
         let tempdx5 = (ball5.physicsBody?.velocity.dy)! / (ball5.physicsBody?.velocity.dx)!
         ball5.physicsBody?.velocity.dx = CGFloat(sender.value)
         ball5.physicsBody?.velocity.dy = (ball5.physicsBody?.velocity.dx)! * tempdx5
         
         let tempdx6 = (ball6.physicsBody?.velocity.dy)! / (ball6.physicsBody?.velocity.dx)!
         ball6.physicsBody?.velocity.dx = CGFloat(sender.value)
         ball6.physicsBody?.velocity.dy = (ball6.physicsBody?.velocity.dx)! * tempdx6
         
         let tempdx7 = (ball7.physicsBody?.velocity.dy)! / (ball7.physicsBody?.velocity.dx)!
         ball7.physicsBody?.velocity.dx = CGFloat(sender.value)
         ball7.physicsBody?.velocity.dy = (ball7.physicsBody?.velocity.dx)! * tempdx7*/
        
        
        let force = SKAction.applyForce(CGVector(dx: CGFloat(-1 * sender.value) , dy: CGFloat(sender.value)) , duration: 0.1)
        ball.physicsBody?.velocity = CGVector(dx:0, dy:0)
        ball.run(force)
        
        let force2 = SKAction.applyForce(CGVector(dx: CGFloat(-1 * sender.value) , dy: CGFloat(sender.value)) , duration: 0.1)
        ball2.physicsBody?.velocity = CGVector(dx:0, dy:0)
        ball2.run(force2)
        
        let force3 = SKAction.applyForce(CGVector(dx: CGFloat(sender.value) , dy: CGFloat(-1 * sender.value)) , duration: 0.1)
        ball3.physicsBody?.velocity = CGVector(dx:0, dy:0)
        ball3.run(force3)
        
        let force4 = SKAction.applyForce(CGVector(dx: CGFloat(-1 * sender.value) , dy: CGFloat(-1 * sender.value)) , duration: 0.1)
        ball4.physicsBody?.velocity = CGVector(dx:0, dy:0)
        ball4.run(force4)
        
        let force5 = SKAction.applyForce(CGVector(dx: CGFloat(-1 * sender.value) , dy: CGFloat(sender.value)) , duration: 0.1)
        ball5.physicsBody?.velocity = CGVector(dx:0, dy:0)
        ball5.run(force5)
        
        let force6 = SKAction.applyForce(CGVector(dx: CGFloat(sender.value) , dy: CGFloat(-1 * sender.value)) , duration: 0.1)
        ball6.physicsBody?.velocity = CGVector(dx:0, dy:0)
        ball6.run(force6)
        
        let force7 = SKAction.applyForce(CGVector(dx: CGFloat(-1 * sender.value) , dy: CGFloat(-1 * sender.value)) , duration: 0.1)
        ball7.physicsBody?.velocity = CGVector(dx:0, dy:0)
        ball7.run(force7)
        
        
        /*for createBalls : SKShapeNode in balls {
         let force = SKAction.applyForce(CGVector(dx: CGFloat(sender.value) , dy: CGFloat(sender.value)) , duration: 0.1)
         createBalls.physicsBody?.velocity = CGVector(dx:0, dy:0)
         createBalls.run(force)
         }*/
        
    }
    
    //https://stackoverflow.com/questions/37940754/how-do-i-make-an-object-bounce-off-the-edges-in-swift
    
    func ballSprite( position: CGPoint) -> SKShapeNode {
        let ball = SKShapeNode(circleOfRadius: 10 )
        ball.fillColor = GlobalConstants.yellow
        ball.strokeColor = GlobalConstants.yellow
        ball.position =  position
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.frame.height / 2)
        ball.physicsBody?.restitution = 1
        ball.physicsBody?.friction = 0
        
        ball.physicsBody?.affectedByGravity = false
        ball.physicsBody?.angularDamping = 0
        ball.physicsBody?.linearDamping = 0
        return ball
    }
    
    override func update(_ currentTime: TimeInterval){
    }
    
}
