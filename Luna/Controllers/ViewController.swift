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
        
        // Set the view's delegate.
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        //        sceneView.showsStatistics = true
        
        // Create sphere geometry.
        let sphere = SCNSphere(radius: 0.2)
        
        // Create material.
        let material = SCNMaterial()
        
        // Style material.
        material.diffuse.contents = UIImage(named: "art.scnassets/Texture Maps/8k_moon.jpeg")
        
        // Assign material to cube.
        sphere.materials = [material]
        
        // Create node (point in 3D space).
        let node = SCNNode()
        
        // Position node.
        node.position = SCNVector3(0.5, 0.1, -0.5)
        
        // Assign cube geometry to node.
        node.geometry = sphere
        
        // Add child node to root node.
        sceneView.scene.rootNode.addChildNode(node)
        
        // Add automatic lighting.
        sceneView.automaticallyUpdatesLighting = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Check for device support.
        if ARWorldTrackingConfiguration.isSupported {
            
            print("Success! This device supports ARWorldTrackingConfiguration")
            
            // Create a session configuration.
            let configuration = ARWorldTrackingConfiguration()
            
            // Run the view's session.
            sceneView.session.run(configuration)
            
        } else {
            
            print("This device does not support ARWorldTrackingConfiguration.")
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if ARWorldTrackingConfiguration.isSupported == false {
            let alert = UIAlertController(title: "Device Not Supported", message: "Sorry, this device does not support the Luna AR experience.", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session.
        sceneView.session.pause()
        
    }
    
    // MARK: - ARSCNViewDelegate
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user.
        
        print(error)
        
        let alert = UIAlertController(title: "Error", message: "Sorry, there was an error creating this AR experience. Try restarting Luna", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Try Again", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay.
        print("Sorry, this AR session has been interrupted.")
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required.
        print("And, we're back.")

    }
}
