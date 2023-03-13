//
//  InputValidator.swift
//  calc
//
//  Created by Donald Ho on 13/3/2022.
//  Copyright © 2022 UTS. All rights reserved.
//  42889_A1_10620084_v5

import Foundation
enum InputError:Error{
    case badStructure,operatorError,operandError,dividByZero
}

func inputValidating(target: Array<String>) throws {
    
    // the input must follow the sequence of [Int, String, Int, String,.........., Int]. Therefore, the count of the item must be a odd number.
    if target.count % 2 == 0 {
        throw InputError.badStructure
        
    }
    
    // the operands must be linked with operators
    for index in stride (from: 1, to: target.count-1, by: 2){
        switch target[index]{
            case "+", "-", "x", "/", "%":
                continue
            default:
                throw InputError.operatorError
            }
    }
    
    // the operands must be interger
    for index in stride (from: 0, to: target.count, by: 2){
        if Int(target[index]) != nil {
            continue
        } else {
            throw InputError.operandError
        }
    }
    
    // the numerators must not be zero
    for index in stride (from: 1, to: target.count-1, by: 2){
        if (target[index] == "/" || target[index] == "%"){
            switch target[index+1] {
            case "0":
                throw InputError.dividByZero
            default:
                continue
            }
        }
    }
}

