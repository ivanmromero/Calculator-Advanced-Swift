//
//  ViewController.swift
//  Calculator
//
//  Created by Ivan Romero on 14/02/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true

   
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a double")
            }
            return number
        }
        set {
            return displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let CalcMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: CalcMethod) {
                            displayValue = result
            }
        }
    }

    
@IBAction func numButtonPressed(_ sender: UIButton) {
    
    //What should happen when a number is entered into the keypad
    if let numValue = sender.currentTitle {
        
        if isFinishedTypingNumber {
            displayLabel.text = numValue
            isFinishedTypingNumber = false
        } else {
            
            if numValue == "."{
                
                let isInt = floor(displayValue) == displayValue
                
                if !isInt {
                    return
                }
            }
            
            displayLabel.text = displayLabel.text! + numValue
        }
    }
}

}

