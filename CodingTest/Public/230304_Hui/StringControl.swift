//
//  StringControl.swift
//  CodingTest
//
//  Created by 홍태희 on 2023/03/01.
//

import Foundation

//문자열 다루기 기본
func StrControl(_ s:String) -> Bool {
    return (s.count == 4 || s.count == 6) && (Int(s) != nil)
}

//StrControl("a1234")
