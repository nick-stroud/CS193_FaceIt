//
//  EmotionsViewController.swift
//  CS193_FaceIt
//
//  Created by Nicholas Stroud on 10/25/16.
//  Copyright © 2016 Nicholas Stroud. All rights reserved.
//

import UIKit

class EmotionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let emotionalFaces = [
        "sad": FacialExpression(eyes: .Open, mouth: .Frown),
        "neutral": FacialExpression(eyes: .Open, mouth: .Neutral),
        "happy": FacialExpression(eyes: .Open, mouth: .Smile)]
        
        // Get the new view controller using segue.destinationViewController.
        let destinationVC = segue.destination
        if let faceVC = destinationVC as? FaceViewController {
            if let identifer = segue.identifier {
                if let expression = emotionalFaces[identifer] {
                    faceVC.expression = expression
                    if let sendingButtion = sender as? UIButton {
                        faceVC.navigationItem.title = sendingButtion.currentTitle
                    }
                }
            }
        }

        // Pass the selected object to the new view controller.
    }

}
