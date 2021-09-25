//
//  ViewController.swift
//  Luna
//
//  Created by Layne Johnson on 9/24/21.
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
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create sphere geometry
        let sphere = SCNSphere(radius: 0.2)
        
        // Create material
        let material = SCNMaterial()
        
        // Style material
        material.diffuse.contents = UIImage(named: "art.scnassets/Texture Maps/8k_moon.jpeg")
        
        // Assign material to cube
        sphere.materials = [material]
        
        // Create node (point in 3D space)
        let node = SCNNode()
        
        // Position node
        node.position = SCNVector3(0.5, 0.1, -0.5)
        
        // Assign cube geometry to node
        node.geometry = sphere
        
        // Add child node to root node
        sceneView.scene.rootNode.addChildNode(node)
        
        // Add automatic lighting
        sceneView.automaticallyUpdatesLighting = true
        
//        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//
//        // Set the scene to the view
//        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if ARWorldTrackingConfiguration.isSupported {
            
            // Create a session configuration
            let configuration = ARWorldTrackingConfiguration()

            // Run the view's session
            sceneView.session.run(configuration)
            
        } else {
            print("This device does not support ARWorldTrackingConfiguration. ")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
   
