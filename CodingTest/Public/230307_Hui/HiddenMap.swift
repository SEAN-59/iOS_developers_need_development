//
//  HiddenMap.swift
//  CodingTest
//
//  Created by 홍태희 on 2023/03/06.
//

import Foundation

//[1차] 비밀지도
func HiddenMap(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    let test1 = Int(String(arr1[0], radix: 2))! //1001 ( 01001 )
    let test2 = Int(String(arr2[0], radix: 2))! //11110
    print(test1 | test2) //OR 연산시 11247출력
    
    let testStr = "11111"
    print(testStr.replacingOccurrences(of: "1", with: "#")) //String(NSString)에서만 작동
    
    var answer: [String] = ["","","","",""] //1. n개만큼 배열인덱스 생성필요 (Index out of range error)
    
    for i in 0..<n {
        //2. String(arr1[i], radix: 2) | String(arr2[i], radix: 2)
        answer[i] = String(Int(String(arr1[i], radix: 2))! | Int(String(arr2[i], radix: 2))!)
        //3-1. (str_value).replacingOccurrences(of: "0", with: " ") //unused!!
        answer[i].replacingOccurrences(of: "0", with: " ")
        //3-2. (str_value).replacingOccurrences(of: "1", with: "#") //unused!!
        answer[i].replacingOccurrences(of: "1", with: "#")
    }
    print(answer)
    return answer
}

//HiddenMap(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28])
