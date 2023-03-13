//
//  Validator.swift
//  calc
//
//  Created by Donald Ho on 13/3/2022.
//  Copyright © 2022 UTS. All rights reserved.
//

import Foundation

class InputValidator {
    var target = [String]()
    var validity = true
    init (target:[String]){
        self.target = target
    }
    
// this function is to ensure all the operads are connecte with proper operators ("+", "-", "*", "/", "%")
    func operatorValidating() -> Bool{
        for index in stride (from: 1, to: target.count-2, by: 2){
            switch target[index]{
            case "+", "-", "*", "/", "%":
                validity = true;
            default:
                validity = false
                break
            }
        }
        return validity
    }

// this function is to ensure all the operands are integers
    func operandValidating() -> Bool{
        for index in stride (from: 0, to: target.count-1, by: 2){
            validity = target[index].isInt
            if !validity {
                break
            }
        }
        return validity
    }
    
// this function ensure no numerator is zero
    func numeratorValidating() -> Bool{
        for index in stride (from: 2, to: target.count-1, by: 2){
            if target[index] == "0" && (target[index-1] == "/" || target[index-1] == "%"){
                validity = false
                break
            }
        }
        return validity
    }
}
