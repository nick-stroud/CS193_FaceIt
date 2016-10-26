//
//  FacialExpression.swift
//  CS193_FaceIt
//
//  Created by Nicholas Stroud on 10/23/16.
//  Copyright © 2016 Nicholas Stroud. All rights reserved.
//

import Foundation

struct FacialExpression {
    enum Eyes {
        case Open
        case Closed
    }
    
    enum Mouth: Int {
        case Frown
        case Smirk
        case Neutral
        case Grin
        case Smile
        
        func sadderMouth() -> Mouth {
            return Mouth(rawValue: rawValue - 1) ?? .Frown
        }
        func happierMouth() -> Mouth {
            return Mouth(rawValue: rawValue + 1) ?? .Smile
        }
    }

    var eyes = Eyes.Open
    var mouth = Mouth.Smile
    


}
