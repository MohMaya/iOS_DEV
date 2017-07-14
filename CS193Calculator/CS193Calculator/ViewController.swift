//
//  ViewController.swift
//  CS193Calculator
//
//  Created by Shivanshu Chaudhary on 27/04/17.
//  Copyright © 2017 Shivanshu Chaudhary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet private weak var display: UILabel!    //during declaration, ! and ? both mean an optional
                                            //optionals are initialized by default to nil
                                            //! => implicit unwrapping. Not need to unwrapping everywhere by putting ! at end of display
    private var userIsInTheMiddleOfTyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle! //! implies associate and give me the value rather than optional values
        //print("touched \(String(describing: digit)) Digit")
        if userIsInTheMiddleOfTyping{
        let textCurrentlyInDisplay = display.text!
        display.text = textCurrentlyInDisplay + digit //+ is used to concatenate the strings
        }
        else
        {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    private var displayValue: Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    private var brain:CalculatorBrain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping{
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle{
            brain.performOperation(symbol: mathematicalSymbol)
            displayValue = brain.result
            /*//If the symbol is not set, and directly unwrapped via !, the app will crash
            if mathematicalSymbol == "π"{
                displayValue = Double.pi
                // display.text = String(Double.pi) //M_PI
            }else if mathematicalSymbol == "√"{
                displayValue = sqrt(self.displayValue)
            } */
            
            
        }
    }
}

