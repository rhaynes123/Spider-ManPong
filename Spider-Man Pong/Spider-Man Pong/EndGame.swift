//
//  EndGame.swift
//  Spider-Man Pong
//
//  Created by richard Haynes on 2/4/24.
//

import Foundation
import SpriteKit
class EndGame: SKScene {
    class func newGameScene() -> EndGame {
        guard let overScene = SKScene(fileNamed: "EndGame") as? EndGame else {
            print("Failed to load EndGame.sks")
            abort()
        }
        overScene.scaleMode = .aspectFill
        return overScene
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        guard let view = self.view else {
            return
        }
        let location : CGPoint = touch.location(in: self)
        let tappedNode : SKNode = atPoint(location)
        if tappedNode.name == "playAgainLabel" {
            
            guard let mainScene = SKScene(fileNamed: "GameScene") as? GameScene else {
                print("Failed to load GameScene.sks")
                abort()
            }
            
            mainScene.scaleMode = .aspectFill
            view.presentScene(mainScene)
        }
    }
}
