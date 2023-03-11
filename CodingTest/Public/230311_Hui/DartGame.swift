//
//  DartGame.swift
//  CodingTest
//
//  Created by 홍태희 on 2023/03/11.
//

import Foundation

//다트게임

//1. 제곱
//2. *, #, *#
func dart(_ dartResult:String) -> Int {
    //print(dartResult.components(separatedBy: ["S","D","T"]))
    
    for i in dartResult.indices {
        if dartResult[i] == "S" {
            //pow(<#T##x: Decimal##Decimal#>, 1)
        }
        if dartResult[i] == "D" {
            //pow(<#T##x: Decimal##Decimal#>, 2)
        }
        if dartResult[i] == "T" {
            //pow(<#T##x: Decimal##Decimal#>, 3)
        }
    }
    return 0
}

//dart("1S2D*3T")
