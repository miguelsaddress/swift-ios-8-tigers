//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by MIGUEL ANGEL MORENO ARMENTEROS on 09/10/14.
//  Copyright (c) 2014 MIGUEL ANGEL MORENO ARMENTEROS. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    var name = ""
    var age = 0
    var breed = ""
    var image = UIImage(named:"")

    func chuff(times n: Int = 1) {
        for x in 1...n{
            println("[\(self.name)]: Chuff chuff")
        }
    }

    func randomFact() -> String {
        let randomNumber = Int(arc4random_uniform(UInt32(3)))
        switch randomNumber {
            case 0:
                return "The Tiger is the biggest species in the cat family"
            case 1:
                return "Tigers can reach a length of 3.3 meters"
            default:
                return  "A group of tigers is known as an 'ambush' or 'streak'"
        }
    }
}