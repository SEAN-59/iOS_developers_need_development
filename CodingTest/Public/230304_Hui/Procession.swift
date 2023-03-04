//
//  Procession.swift
//  CodingTest
//
//  Created by 홍태희 on 2023/03/01.
//

import Foundation

func Procession(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result = arr1

    for i in 0..<result.count {
        for j in 0..<result[i].count {
            result[i][j] += arr2[i][j]
        }
    }
    
    return result
}

//Procession([[1,2],[2,3]], [[3,4],[5,6]])
