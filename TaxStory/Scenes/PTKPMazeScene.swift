//
//  PTKPMazeScene.swift
//  TaxStory
//
//  Created by Timothy on 06/07/23.
//

import SpriteKit
import CoreMotion

enum CollisionTypes: UInt32 {
    case player = 1
    case wall = 2
    case wrong = 4
    case correct = 8
}

class PTKPMazeScene: SKScene {
    var player: SKShapeNode!
    var motionManager: CMMotionManager?
    
    override func didMove(to view: SKView) {
        view.backgroundColor = .clear
        
        let background = SKSpriteNode(color: .clear, size: self.frame.size)
        background.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        background.blendMode = .replace
        background.zPosition = -1

        addChild(background)

        loadMaze()
//
        physicsWorld.gravity = .zero
        
        motionManager = CMMotionManager()
        motionManager?.startAccelerometerUpdates()
    }
    
    func loadMaze() {
        guard let mazeURL = Bundle.main.url(forResource: "PTKPMaze", withExtension: "txt") else { fatalError("Could not find PTKPMaze.txt in the app bundle!") }
        guard let mazeString = try? String(contentsOf: mazeURL) else { fatalError("Could not load PTKPMazeScene.txt in the app bundle!") }
        
        let lines = mazeString.components(separatedBy: "\n")
        
        for (row, line) in lines.reversed().enumerated() {
            for (column, letter) in line.enumerated() {
                let position = CGPoint(x: ((self.frame.size.height / 14) * CGFloat(column)) + self.frame.size.width / 10.5, y: ((self.frame.size.height / 14) * CGFloat(row)) - self.frame.size.height / 28)
                
                if letter == "x" {
                    // load wall
                    let node = SKSpriteNode(color: .black, size: CGSize(width: self.frame.size.height / 14, height: self.frame.size.height / 14))
                    node.name = "wall"
                    node.position = position
                    
                    node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
                    node.physicsBody?.categoryBitMask = CollisionTypes.wall.rawValue
                    node.physicsBody?.isDynamic = false
                    
                    addChild(node)
                } else if letter == "w"{
                    // wrong answer
                    let node = SKSpriteNode(color: .red, size: CGSize(width: self.frame.size.height / 14, height: self.frame.size.height / 14))
                    node.name = "wrong"
                    node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
                    node.physicsBody?.isDynamic = false
                    
                    node.physicsBody?.categoryBitMask = CollisionTypes.wrong.rawValue
                    node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
                    node.physicsBody?.collisionBitMask = 0
                    node.position = position
                    
                    addChild(node)
                } else if letter == "t"{
                    // correct answer
                    let node = SKSpriteNode(color: .green, size: CGSize(width: self.frame.size.height / 14, height: self.frame.size.height / 14))
                    node.name = "true"
                    node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
                    node.physicsBody?.isDynamic = false
                    
                    node.physicsBody?.categoryBitMask = CollisionTypes.correct.rawValue
                    node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
                    node.physicsBody?.collisionBitMask = 0
                    node.position = position
                    
                    addChild(node)
                } else if letter == "p" {
//                    var Circle = SKShapeNode(circleOfRadius: 100 ) // Size of Circle
//                        Circle.position = CGPointMake(frame.midX, frame.midY)  //Middle of Screen
//                        Circle.strokeColor = SKColor.blackColor()
//                        Circle.glowWidth = 1.0
//                        Circle.fillColor = SKColor.orangeColor()
//                        self.addChild(Circle)
                    
//                    player = SKSpriteNode(color: .brown, size: CGSize(width: self.frame.size.height / 19, height: self.frame.size.height / 19))
                    player = SKShapeNode(circleOfRadius: self.frame.size.height / 38)
                    player.position = position
                    player.zPosition = 1
                    player.strokeColor = SKColor.brown
                    player.fillColor = SKColor.brown
                    player.glowWidth = 2.0
                    
                    player.physicsBody = SKPhysicsBody(circleOfRadius: player.frame.size.width / 2)
                    player.physicsBody?.allowsRotation = false
                    player.physicsBody?.linearDamping = 0.5
                    
                    player.physicsBody?.categoryBitMask = CollisionTypes.player.rawValue
                    player.physicsBody?.contactTestBitMask = CollisionTypes.wrong.rawValue | CollisionTypes.correct.rawValue
                    player.physicsBody?.collisionBitMask = CollisionTypes.wall
                        .rawValue
                    
                    addChild(player)
                } else if letter == " " {
                    // do nothing
                } else {
                    fatalError("Unknown letter \(letter)!")
                }
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if let accelerometerData = motionManager?.accelerometerData {
            physicsWorld.gravity = CGVector(dx: accelerometerData.acceleration.y * -30, dy: accelerometerData.acceleration.x * 30)
        }
    }
}
