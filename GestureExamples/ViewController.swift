//
//  ViewController.swift
//  GestureExamples
//
//  Created by Андрей Сергиенко on 12/3/18.
//  Copyright © 2018 Андрей Сергиенко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var movableView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movableView.isUserInteractionEnabled = true
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchRecognized(_:)))
        movableView.addGestureRecognizer(pinchGesture)
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotationRecognized(_:)))
        movableView.addGestureRecognizer(rotateGesture)
    }

    @IBAction func tapRecognized(_ sender: Any) {
        view.backgroundColor = UIColor(red: CGFloat(CGFloat.random(in: 0...255)/255), green: CGFloat(CGFloat.random(in: 0...255)/255), blue: CGFloat(CGFloat.random(in: 0...255)/255), alpha: 1.0)
    }
    
    @IBAction func panRecognized(_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: view)
        movableView.center = point
    }
    
    @objc func pinchRecognized(_ sender: UIPinchGestureRecognizer) {
        movableView.transform = movableView.transform.scaledBy(x: sender.scale,
                                                               y: sender.scale)
        sender.scale = 1
    }
    
    @objc func rotationRecognized(_ sender: UIRotationGestureRecognizer) {
        if sender.state == UIGestureRecognizer.State.changed {
            let transform = CGAffineTransform(rotationAngle: sender.rotation)
            movableView.transform = transform
        }
    }
}
