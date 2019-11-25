//
//  Calc.swift
//  Calculator
//
//  Created by Adrian Atanasov on 11/24/19.
//  Copyright © 2019 Adrian Atanasov. All rights reserved.
//

import Foundation


class Calc {
    class func calculate(option:Int, string: String, makeNeg: Bool) -> Double {
      var answer = 0.0
      var inputcon = Double(string)!
        if(makeNeg == true){
         inputcon = inputcon * -1
        }else if(makeNeg == false){
        inputcon = abs(inputcon)
        }
        switch option {
        case 0: //Farenheit to Celcius
            answer = (inputcon - 32.0) * (5/9)
        case 1: //Celcius to Farenheit
            answer = (inputcon * (9/5)) + 32
        case 2: //Miles to Kilometers
            answer = inputcon * 1.609
        case 3: //Kilometers to Miles
            answer = inputcon / 1.609
        default:
            print("Error")
        }
        return answer
    }
}
