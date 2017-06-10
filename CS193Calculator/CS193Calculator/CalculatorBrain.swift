//
//  CalculatorBrain.swift
//  CS193Calculator
//
//  Created by Shivanshu Chaudhary on 29/05/17.
//  Copyright © 2017 Shivanshu Chaudhary. All rights reserved.
//

import Foundation

func multiply(op1: Double,op2: Double)->Double{
    return op1 * op2;
}



class CalculatorBrain{
    
    private var accumulator = 0.0
    
    func setOperand(operand:Double){
        accumulator = operand
    }
    
    private var operations: Dictionary<String,Operation> = [
        "π":Operation.Constant(Double.pi),
        "e":Operation.Constant(M_E),
        "±":Operation.UnaryOperation({ -$0 }),
        "√":Operation.UnaryOperation(sqrt),
        "cos":Operation.UnaryOperation(cos),
        "×": Operation.BinaryOperation(multiply),
        "÷": Operation.BinaryOperation({(op1: Double, op2:Double)-> Double in return op1/op2}),
        // Instead of using different functions for every operation, we use closure whuich is an inline function definition
        "+": Operation.BinaryOperation({ (op1,op2) in return op1+op2}), // We have minimized the above code using type inference feature of swift
        "-": Operation.BinaryOperation({$0 - $1}),  //Further minimized using positional arguments
        "=": Operation.Equals
    ]
    
    private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)     //A function that take a double and returns a double
        case BinaryOperation((Double,Double) -> Double)
        case Equals
    }
    
    
    func performOperation(symbol:String){
        if let operation = operations[symbol]{//operation is local variable Operation is enum and operation is of type Operation
            switch operation{
            case .Constant(let associatedConstantValue):
                accumulator = associatedConstantValue
            case .UnaryOperation(let function):
                accumulator = function(accumulator)     //function is a local variable that takes double and returns double
            case .BinaryOperation(let function):
                executePendingBinaryOperation()
                pending = pendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals: executePendingBinaryOperation()
                
            }
        }
    }

    private func executePendingBinaryOperation(){
        if pending != nil{
            accumulator = pending!.binaryFunction(pending!.firstOperand,accumulator)
            pending=nil
        }
    }


    private var pending: pendingBinaryOperationInfo?    //it is an optional because, as long as user hasn't given any binaryopertaion, this has to be null
    
    private struct pendingBinaryOperationInfo{      // The initializers of an struct are its vars
        var binaryFunction: (Double,Double) -> Double
        var firstOperand: Double
    }
    
    var result: Double{
        //Using only get and not set, makes the property read only
        get{
            return accumulator
        }
    }
    
}
