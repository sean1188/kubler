//
//  GameVC.swift
//  kübler
//
//  Created by Sean Lim on 30/5/17.
//  Copyright © 2017 covve. All rights reserved.
//

import UIKit
import Bayes
import QuartzCore
import SceneKit

class GameVC: UIViewController {

    var gameView :SCNView!
    var gameScene:SCNScene!
    var cameraNode:SCNNode!
    var targetCreationTime: TimeInterval = 0
    
    func initView(){
        gameView = self.view as! SCNView
        gameView.allowsCameraControl = true
        gameView.autoenablesDefaultLighting = true
    }
    
    func initScene(){
        gameScene = SCNScene()
        gameView.scene = gameScene
        gameView.isPlaying = true
    }
    
    func initCamera() {
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        
        cameraNode.position = SCNVector3(x:0, y:5,z:10)
    }
    
    func createTarget(){
        let shape = SCNPyramid.init(width: 1, height: 1, length: 1)
        shape.materials.first?.diffuse.contents = UIColor.white
        let shapeNode = SCNNode.init(geometry: shape)
        
        gameScene.rootNode.addChildNode(shapeNode)
    }
    override func viewDidLoad() {
        super.viewDidLoad()        
    }

}


class MoodClassifier {
    
    var eventspace = EventSpace<String,String>()
    
    init(input:String) {

    }
    
}
