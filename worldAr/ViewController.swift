//
//  ViewController.swift
//  worldAr
//
//  Created by Vivaan Baid on 26/10/21.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    @IBAction func reset_pressed(_ sender: Any) {
        restartsession()
    }
    
    
    func restartsession(){
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes { mynode, _ in
            mynode.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options: [.resetTracking,.removeExistingAnchors])
        
    }
    
    
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    
    @IBAction func add_pressed(_ sender: Any) {
        print("pressed")
        
        let node  = SCNNode()
        node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        node.position = SCNVector3(x: 0, y: 0, z: -0.3)
        node.eulerAngles = SCNVector3(x: 3.14, y: 0, z: 0)
        self.sceneView.scene.rootNode.addChildNode(node)
//        let nodetwo = SCNNode()
//        nodetwo.geometry =  SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0.3)
//        nodetwo.position = SCNVector3(0, 0.3, 0)
//
//        let node = SCNNode()
//        node.geometry = SCNCone(topRadius: 0.2, bottomRadius: 0.3, height: 0.2)
//        node.addChildNode(nodetwo)
////        let path = UIBezierPath()
////        path.move(to: CGPoint(x: 0, y: 0))
////        path.addLine(to: CGPoint(x: 0, y: 0.3))
////        let shape = SCNShape(path: path, extrusionDepth: CGFloat(0.2))
////        node.geometry = shape
////
//
//        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
//        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
//        node.position = SCNVector3(0, 0, -0.3)
//        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    
    
    //World tracking is used to track the position and orientation of your device relative to the real world at all times
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.debugOptions = [.showFeaturePoints,.showWorldOrigin]
        self.sceneView.session.run(configuration, options: .stopTrackedRaycasts)
        self.sceneView.autoenablesDefaultLighting = true
    }
    

}

