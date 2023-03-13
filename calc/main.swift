//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//  42889_A1_10620084_v5

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

// Validate the input
if args.count == 1 {
    print(Int(args[0])!)
    exit(0)
}

do{
    try inputValidating(target: args)
} catch {
    switch error{
    case InputError.badStructure:
        print("Error: structure error")
        exit(1)
    case InputError.operatorError:
        print("Error: invalid operator!")
        exit(1)
    case InputError.operandError:
        print("Error: invalid operand!")
        exit(1)
    case InputError.dividByZero:
        print("Error: numerator of zero!")
        exit(2)
    default:
        break
    }
}

// once the input is validated. 
let calculation = Calculator(target: args)
print(calculation.calculate())
