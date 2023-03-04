//
//  PriceCount.swift
//  CodingTest
//
//  Created by 홍태희 on 2023/03/01.
//

import Foundation

//부족한 금액 계산하기
func PriceCount(_ price:Int, _ money:Int, _ count:Int) -> Int64 {
    var result = 0
    
    for num in 1...count {
        result += price*num
    }
    
    return (result-money > 0) ? Int64(result-money) : 0
}

//PriceCount(3, 20, 4)
