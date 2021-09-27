//
//  ViewController.swift
//  ARDicee
//
//  Created by Darshil Agrawal on 09/10/20.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the view's delegate
        sceneView.delegate = self
//        let cube=SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
//        let material=SCNMaterial()
//        material.diffuse.contents=UIColor.red
//        cube.materials=[material]
//        let node=SCNNode()
//        node.geometry=cube
//        node.position=SCNVector3(0, 0.1, -0.5)
//        sceneView.scene.rootNode.addChildNode(node)
        sceneView.autoenablesDefaultLighting=true
        // Show statistics such as fps and timing information
        
        
        // Create a new scene
        let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")
        
        if let diceNode=diceScene?.rootNode.childNode(withName: "Dice", recursively: true){
        diceNode.position=SCNVector3(0.1, 0.1, -0.2)
            sceneView.scene.rootNode.addChildNode(diceNode)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Pause the view's session
        sceneView.session.pause()
    }

    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if anchor is ARPlaneAnchor{
            let planeAnchor = anchor as! ARPlaneAnchor    
        }
    }
}
