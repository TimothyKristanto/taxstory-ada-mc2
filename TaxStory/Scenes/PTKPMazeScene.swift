//
//  PTKPMazeScene.swift
//  TaxStory
//
//  Created by Timothy on 06/07/23.
//

import SpriteKit
import CoreMotion
import SwiftUI

enum CollisionTypes: UInt32 {
    case player = 1
    case wall = 2
    case wrong = 4
    case correct = 8
}

class PTKPMazeScene: SKScene, SKPhysicsContactDelegate {
    var player: SKSpriteNode!
    var motionManager: CMMotionManager?
    
    @Binding var isWrong: Bool
    @Binding var isCorrect: Bool
    @Binding var wrongText: String

    init(wrong: Binding<Bool>, correct: Binding<Bool>, text: Binding<String>) {
        _isWrong = wrong
        _isCorrect = correct
        _wrongText = text
        super.init(size: CGSize(width: Constants.screenWidth, height: Constants.screenHeight))
        self.scaleMode = .aspectFit
    }
    
    required init?(coder aDecoder: NSCoder) {
        _isWrong = .constant(false)
        _isCorrect = .constant(false)
        _wrongText = .constant("")
        super.init(coder: aDecoder)
    }
    
    override func didMove(to view: SKView) {
        view.backgroundColor = .clear
        
        let background = SKSpriteNode(color: .clear, size: self.frame.size)
        background.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        background.blendMode = .replace
        background.zPosition = -1

        addChild(background)

        loadMaze()

        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        
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
                    let node = SKSpriteNode(imageNamed: "SquareMaze")
                    node.name = "wall"
                    node.position = position
                    node.size = CGSize(width: self.frame.size.height / 14, height: self.frame.size.height / 14)
                    
                    node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
                    node.physicsBody?.categoryBitMask = CollisionTypes.wall.rawValue
                    node.physicsBody?.isDynamic = false
                    
                    addChild(node)
                } else if letter == "w"{
                    // wrong answer
                    let node = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.size.height / 14, height: self.frame.size.height / 14))
                    node.name = "tk1"
                    node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
                    node.physicsBody?.isDynamic = false
                    
                    node.physicsBody?.categoryBitMask = CollisionTypes.wrong.rawValue
                    node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
                    node.physicsBody?.collisionBitMask = 0
                    node.position = position
                    
                    addChild(node)
                } else if letter == "t"{
                    // correct answer
                    let node = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.size.height / 14, height: self.frame.size.height / 14))
                    node.name = "correct"
                    node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
                    node.physicsBody?.isDynamic = false
                    
                    node.physicsBody?.categoryBitMask = CollisionTypes.correct.rawValue
                    node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
                    node.physicsBody?.collisionBitMask = 0
                    node.position = position
                    
                    addChild(node)
                } else if letter == "p" {
                    player = SKSpriteNode(imageNamed: "ball")
                    player.position = position
                    player.zPosition = 1
                    player.size = CGSize(width: self.frame.width / 24, height: self.frame.width / 24)
                    
                    player.physicsBody = SKPhysicsBody(circleOfRadius: player.size.width / 2)
                    player.physicsBody?.allowsRotation = true
                    player.physicsBody?.linearDamping = 0.5
                    
                    player.physicsBody?.categoryBitMask = CollisionTypes.player.rawValue
                    player.physicsBody?.contactTestBitMask = CollisionTypes.wrong.rawValue | CollisionTypes.correct.rawValue
                    player.physicsBody?.collisionBitMask = CollisionTypes.wall
                        .rawValue
                    
                    addChild(player)
                }else if letter == "y"{
                    let node = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.size.height / 14, height: self.frame.size.height / 14))
                    node.name = "k0"
                    node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
                    node.physicsBody?.isDynamic = false
                    
                    node.physicsBody?.categoryBitMask = CollisionTypes.wrong.rawValue
                    node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
                    node.physicsBody?.collisionBitMask = 0
                    node.position = position
                    
                    addChild(node)
                } else if letter == " " {
                    // do nothing
                } else {
                    fatalError("Unknown letter \(letter)!")
                }
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        guard isWrong == false else { return }
        guard isCorrect == false else { return }
        
        if let accelerometerData = motionManager?.accelerometerData {
            physicsWorld.gravity = CGVector(dx: accelerometerData.acceleration.y * -30, dy: accelerometerData.acceleration.x * 30)
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }

        if nodeA == player {
            playerCollided(with: nodeB)
        } else if nodeB == player {
            playerCollided(with: nodeA)
        }
    }
    
    func playerCollided(with node: SKNode) {
        if node.name == "tk1" {
            player.physicsBody?.isDynamic = false
            isWrong = true
            wrongText = node.name!
            
            let remove = SKAction.removeFromParent()
            player.run(remove)
            
            loadMaze()
        } else if node.name == "k0" {
            player.physicsBody?.isDynamic = false
            isWrong = true
            wrongText = node.name!
            
            let remove = SKAction.removeFromParent()
            player.run(remove)
            
            loadMaze()
        } else if node.name == "correct" {
            player.physicsBody?.isDynamic = false
            isCorrect = true
            
            let move = SKAction.move(to: node.position, duration: 0.15)
            
            player.run(move)
        }
    }
}
