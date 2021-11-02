//
//  GameScene.swift
//  edwardlauv
//
//  Created by admin on 30/10/2021.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let player = SKSpriteNode(imageNamed: "motobike.png")
    var touchPlayer = false
     
    override func didMove(to view: SKView) {
        let road = SKSpriteNode(imageNamed: "road.png")
        road.zPosition = -1
        road.size = UIScreen.main.bounds.size
        addChild(road)
        
        player.setScale(CGFloat(2))
        player.zPosition = 1
        player.position.y = -(UIScreen.main.bounds.height/2) + 100
        addChild(player)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // check if touch first is return dont work
        guard let touch = touches.first else { return }
        
        // get location touchs and add touch node check location player, if true set touch player
        let location = touch.location(in: self)
        let tappedNode = nodes(at: location)
        
        if tappedNode.contains(player) {
            touchPlayer = true
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // check touch player
        guard touchPlayer else { return }
        guard let touch = touches.first else { return }
        // get location touch and add to player
        let location = touch.location(in: self)
        player.position = location
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchPlayer = false
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
