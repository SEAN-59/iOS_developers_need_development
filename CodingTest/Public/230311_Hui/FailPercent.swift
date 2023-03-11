//
//  FailPercent.swift
//  CodingTest
//
//  Created by 홍태희 on 2023/03/11.
//

import Foundation

//실패율
func Failed(_ N:Int, _ stages:[Int]) -> [Int] {
    var answer = [Int : Double]()

    for round in 1...N+1 {
        var counts = 0.0
        
        for index in stages.indices {
            if stages[index] == round {
                counts = counts + 1
            }
        }
        answer[round] = counts/Double(stages.count)
    }
    
    var failPercent = answer.sorted { (first, second) in
        if first.value == second.value {
            return first.key < second.key
        } else {
            return first.value > second.value
        }
    }
    //[(key: 2, value: 0.375), (key: 3, value: 0.25), (key: 1, value: 0.125), (key: 4, value: 0.125), (key: 6, value: 0.125), (key: 5, value: 0.0)]
    print(failPercent)
    
    return []
}

//Failed(5, [2, 1, 2, 6, 2, 4, 3, 3]) //[3,4,2,1,5]
