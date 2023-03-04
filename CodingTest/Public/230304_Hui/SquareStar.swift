//
//  SquareStar.swift
//  CodingTest
//
//  Created by 홍태희 on 2023/03/01.
//

import Foundation

//직사각형 별찍기
func SquareStars(_ n : [Int]) { //임시함수
    //let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
    let (a, b) = (n[0], n[1])

    for _ in 1...b {
        print(String(repeating:"*", count : a))
    }
}

//SquareStars([5, 3])
