//
//  KeyInput.swift
//  CodingTest
//
//  Created by Sean Kim on 2023/02/18.
//

import Foundation

struct KeyInputResult {
    var inputArray : [Any]
    var resultType: KeyInputError
}

enum KeyInputError {
    case OK
    case ERROR
}

class KeyInput {
    /// 입력으로 들어오는 값이 어떠한 값으로 들어오던 전부 String 의 형태로 변환하는 함수
    func keyReadLine(_ inputString: String?) -> KeyInputResult {
        var result : KeyInputResult = .init(inputArray: [], resultType: .ERROR)
        if let inputString = inputString {
            result.inputArray = inputString.components(separatedBy: " ")
            result.resultType = .OK
            return result
        } else { return result }
    }
    
    /// 입력으로 Int 외의 다른 타입의 입력이 들어오는 경우에 해당 함수 사용
    func keyReadLineInt(_ inputString: String?) -> KeyInputResult {
        var result : KeyInputResult = self.keyReadLine(inputString)
        if result.resultType == .OK {
            let inputArray = result.inputArray as! [String]
            let convertArray = inputArray.map({Int($0)})

            if convertArray.filter({$0 == nil}).count > 0 {
                result.resultType = .ERROR
                return result
            }
            
            result.inputArray = convertArray as! [Int]

            return result
        } else { return result }
    }

    /// 무조건 입력으로 Int 형의 값만 들어오는게 100% 확신 하는 경우에는 아래 함수를 사용해도 상관 없음
//    func keyReadLineInt(_ inputString: String?) -> KeyInputResult {
//        var result : KeyInputResult = self.keyReadLine(inputString)
//        if result.resultType == .OK {
//            let inputArray = result.inputArray as! [String]
//            result.inputArray = inputArray.map({Int($0)!})
//            return result
//        } else { return result }
//    }

}
