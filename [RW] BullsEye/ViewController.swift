//
//  ViewController.swift
//  [RW] BullsEye
//
//  Created by Sherman Shi on 2/27/19.
//  Copyright © 2019 Sherman Shi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 1
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
        
    }
    
    @IBAction func showAlert(_ sender: Any) {
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        score += points
        
        let title: String
        
        if difference == 0 {
            
            title = "Perfect!"
            points += 100
            
        } else if difference < 5 {
            
            title = "So close!"
            
            if difference == 1 {
                
                points += 50
                
            }
            
        } else if difference < 10 {
            
            title = "Getting there!"
            
        } else {
            
            title = "Not even close!"
            
        }
        
        round += 1
        
        let message = "You scored \(points) points!"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Great!", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
        
    }    

    @IBAction func sliderMoved(_ sender: UISlider) {
        
        let roundedValue = sender.value.rounded()
        
        currentValue = Int(roundedValue)
        
    }
    
    func startNewRound() {
        
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        
    }
    
    func updateLabels() {
        
        targetValueLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        
    }
    
}

