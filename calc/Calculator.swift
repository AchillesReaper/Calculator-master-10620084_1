//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//  42889_A1_10620084_v5

import Foundation

class Calculator {
    
    var target: Array<String>
    init(target: Array<String>){
        self.target = target
    }

    
    // this function act as the "=" key of a calculator, and control the calculation piority
    func calculate() -> Int{
        var tier1Operator = 0           // tier1Operator counts the number of tier 1 operators("x", "/", and "%" ) in the input.
        for index in stride(from: 1, to: target.count-1, by: 2){
            switch target[index]{
            case "x","/","%":
                tier1Operator += 1
            default:
                continue
            }
        }
        // everytime func tier1cal is called, a tier 1 operator will finish its job and be removed from the input
        while tier1Operator > 0 {
            tier1Cal()
            tier1Operator -= 1
        }
        
        tier2Cal()
        
        return Int(target[0])!
    }

    // function tier1Cal handles operators "x", "/", and "%"
    // function tier2Cal handles operators "+" and "-"
    func tier1Cal() {
        var currentResult: Int
        for index in stride(from: 1, to: target.count-1, by: 2){
            if (target[index] == "x" || target[index] == "/" || target[index] == "%"){
                
                let number1 = Int(target[index - 1])!
                let number2 = Int(target[index + 1])!
                
                switch target[index]{
                case "x":
                    currentResult = number1 * number2
                case "/":
                    currentResult = number1 / number2
                case "%":
                    currentResult = number1 % number2
                default:
                    print("tier1 unknown error")
                    exit(2)
                }
                // target is updated with the operation result
                target[index-1] = String(currentResult)
                target.remove(at: index+1)
                target.remove(at: index)

                break
            }
        }
    }
        
    func tier2Cal(){
        var number1: Int
        var number2: Int
        var currentResult: Int
        while target.count > 1 {
            number1 = Int(target[0])!
            number2 = Int(target[2])!
            switch target[1]{
            case "+":
                currentResult = number1 + number2
            case "-":
                currentResult = number1 - number2
            default:
               exit(2)
            }
            target[0] = String(currentResult)
            target.remove(at: 2)
            target.remove(at: 1)
        }
    }
}

