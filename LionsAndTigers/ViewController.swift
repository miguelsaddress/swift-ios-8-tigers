//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by MIGUEL ANGEL MORENO ARMENTEROS on 08/10/14.
//  Copyright (c) 2014 MIGUEL ANGEL MORENO ARMENTEROS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    //array to hold the tigers
    //var tigers: Array<Tiger> = []
    var tigers:[Tiger] = []
    //holds the array index that was last displayed
    var lastShownTiger = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initTigersArray()
        self.setDataFromTiger(self.getRandomTiger())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        UIView.transitionWithView(self.view, duration: 1,
            options: UIViewAnimationOptions.TransitionCurlUp,
            animations: {
                let tiger = self.getRandomTiger()
                self.setDataFromTiger(tiger)
            }, completion: {
                (finished:Bool) -> () in
        })
    }
    
    private  func initTigersArray() {
        var firstTiger = Tiger()
        firstTiger.name = "Tigger"
        firstTiger.breed = "Bengal"
        firstTiger.age = 3
        firstTiger.image = UIImage(named:"BengalTiger.jpg")
        
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named:"IndochineseTiger.jpg")
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named:"MalayanTiger.jpg")
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named:"SiberianTiger.jpg")
        
        //This is to practise different ways to append elements to an array
        self.tigers.append(firstTiger)
        self.tigers += [secondTiger, thirdTiger, fourthTiger]
    }

    private func setDataFromTiger(tiger:Tiger) {
        self.ageLabel.text = "Age: \(tiger.age)"
        self.nameLabel.text = "Name: \(tiger.name)"
        self.breedLabel.text = "Breed: \(tiger.breed)"
        self.myImageView.image = tiger.image
        self.randomFactLabel.text = tiger.randomFact()
        tiger.chuff(times: 2)
    }
    
    private func generateRandomNumber( max: Int = 10 )->Int {
        let randomNumber = Int(arc4random_uniform(UInt32(max)))
        return randomNumber
    }
    
    private func getRandomTiger() -> Tiger {
        var tigerIndex:Int
        do {
            tigerIndex = generateRandomNumber(max: tigers.count)
            println("last shown index  = \(self.lastShownTiger)")
            println("Tiger index selected = \(tigerIndex)")
        } while tigerIndex == self.lastShownTiger

        self.lastShownTiger = tigerIndex
        return tigers[tigerIndex]

    }

}

