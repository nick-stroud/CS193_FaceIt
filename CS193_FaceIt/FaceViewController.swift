//
//  ViewController.swift
//  CS193_FaceIt
//
//  Created by Nicholas Stroud on 10/23/16.
//  Copyright © 2016 Nicholas Stroud. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController
{
//# MARK: Public
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: #selector(FaceView.changeScale(recognizer:))))
            
            let happierSwipeGestureRecognizer = UISwipeGestureRecognizer(
                target: self,
                action: #selector(FaceViewController.increaseHappiness)
            )
            happierSwipeGestureRecognizer.direction = .up
            faceView.addGestureRecognizer(happierSwipeGestureRecognizer)
            
            let saddierSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(FaceViewController.decreaseHappiness))
            saddierSwipeGestureRecognizer.direction = .down
            faceView.addGestureRecognizer(saddierSwipeGestureRecognizer)
            
            updateUI()
        }
    }
    
    func increaseHappiness() {
        expression.mouth = expression.mouth.happierMouth()
    }
    
    func decreaseHappiness() {
        expression.mouth = expression.mouth.sadderMouth()
    }
    
    var expression = FacialExpression(eyes: .Open,mouth: .Frown) { didSet { updateUI() } }
    
    private var mouthCurvatures = [FacialExpression.Mouth.Frown:-1.0, .Smirk:-0.2, .Neutral:0.0, .Grin:0.5, .Smile:1.0]
    
    private func updateUI() {
        if faceView != nil {
            faceView.mouthCurvature = mouthCurvatures[expression.mouth] ?? 0.0
        }
    }
    
    
    
    
}





