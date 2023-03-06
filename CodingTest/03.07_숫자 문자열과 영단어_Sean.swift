//
//  03.07_숫자 문자열과 영단어_Sean.swift
//  CodingTest
//
//  Created by Sean Kim on 2023/03/06.
//

import Foundation

// 시작 23:40 -  종료 00:25
func solution(_ s:String) -> Int {
    var intArr = [Int]()
    var checkStr = ""
    var result: Int = 0
    
    for i in s {
        if (i as Character).isNumber {
            intArr.append((i as Character).wholeNumberValue!)
        } else {
            checkStr.append(i)
            switch checkStr
            {
            case "zero":
                intArr.append(0)
                checkStr = ""
            case "one":
                intArr.append(1)
                checkStr = ""
            case "two":
                intArr.append(2)
                checkStr = ""
            case "three":
                intArr.append(3)
                checkStr = ""
            case "four":
                intArr.append(4)
                checkStr = ""
            case "five":
                intArr.append(5)
                checkStr = ""
            case "six":
                intArr.append(6)
                checkStr = ""
            case "seven":
                intArr.append(7)
                checkStr = ""
            case "eight":
                intArr.append(8)
                checkStr = ""
            case "nine":
                intArr.append(9)
                checkStr = ""
            default:
                print("Next")
            }
        }
    }
    
    for i in 0 ..< intArr.count {
        var value = 1
        for _ in 0 ..< (intArr.count - i-1) {
            value *= 10
        }
        result += intArr[i] * value
    }
    
    return result
    
}
