//
//  ContentView.swift
//  Spider-Man Pong
//
//  Created by richard Haynes on 2/4/24.
//

import SwiftUI
import SpriteKit
struct ContentView: View {
    private var scene : GameScene {
        guard let gameScene = SKScene(fileNamed: "GameScene") as? GameScene else {
            return GameScene()
        }
        gameScene.scaleMode = .aspectFill
        return gameScene
    }
    var body: some View {
        VStack {
            SpriteView(scene: self.scene).ignoresSafeArea()
        }
        
    }
}

#Preview {
    ContentView()
}
