//
//  ViewController.swift
//  [RW] BullsEye
//
//  Created by Sherman Shi on 2/27/19.
//  Copyright © 2019 Sherman Shi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
        
    }
    
    @IBAction func showAlert(_ sender: Any) {
        
        let alert = UIAlertController(title: "Hello World", message: "The value of the slider is: \(currentValue)." + "\nThe target value was: \(targetValue).", preferredStyle: .alert)
        
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
        
    }
    
}

