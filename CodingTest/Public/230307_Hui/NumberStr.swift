//
//  NumberStr.swift
//  CodingTest
//
//  Created by 홍태희 on 2023/03/04.
//

import Foundation

//숫자 문자열과 영단어
func NumberStr(_ s:String) -> Int {
    var result = s
    let numberStr = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    let numberInt = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

    for i in numberStr.indices {
        result = result.replacingOccurrences(of: numberStr[i], with: numberInt[i])
    }
    
    return Int(result)!
}

//NumberStr("one4seveneight")
