//
//  GameScene.swift
//  Spider-Man Pong
//
//  Created by richard Haynes on 2/4/24.
//

import Foundation
import SpriteKit
class GameScene : SKScene, SKPhysicsContactDelegate {
    
    private var pauseLabel : SKLabelNode = SKLabelNode()
    private var paddle = SKSpriteNode()
    private var ceiling = SKSpriteNode()
    private var ball = SKSpriteNode()
    
    private func setUpBall() {
        ball = self.childNode(withName: "spiderBall") as! SKSpriteNode
        ball.physicsBody?.restitution = 1 // Makes the ball very bouncy
        // Makes the ball faster as it bounces
        ball.physicsBody?.velocity.dy *= 1.1
        ball.physicsBody?.velocity.dx *= 1.1
    }
    
    private func setUpPaddle() {
        paddle = self.childNode(withName: "paddle") as! SKSpriteNode
        paddle.physicsBody?.isDynamic = false
        ceiling = self.childNode(withName: "ceiling") as! SKSpriteNode
        ceiling.physicsBody?.isDynamic = false
    }
    
    private func setUpLabel() {
        pauseLabel = self.childNode(withName: "pause") as! SKLabelNode
    }
    
    private func endGame(){
        guard let overScene = SKScene(fileNamed: "EndGame") as? EndGame else {
            print("Failed to load EndGame.sks")
            abort()
        }
        overScene.scaleMode = .aspectFill
        self.view?.presentScene(overScene)
    }
    
    private func handleTouches(_ touches: Set<UITouch>) {
        for touch in touches {
            
            let location : CGPoint = touch.location(in: self)
            let tappedNode : SKNode = atPoint(location)
            
            if tappedNode.name == pauseLabel.name {
                self.view?.isPaused.toggle()
            }
            else {
                paddle.position = location
            }
            
        }
    }
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        self.setUpBall()
        self.setUpPaddle()
        self.setUpLabel()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTouches(touches)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTouches(touches)
    }
    override func update(_ currentTime: TimeInterval) {
        if self.ball.position.y <= -300 {
            self.endGame()
        }
    }
}
