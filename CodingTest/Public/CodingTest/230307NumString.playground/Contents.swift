import Foundation
import XCTest

func solution(_ s:String) -> Int {
    
    let numDictionary = [
            "zero" : "0",
            "one": "1",
            "two": "2",
            "three": "3",
            "four": "4",
            "five": "5",
            "six": "6",
            "seven": "7",
            "eight": "8",
            "nine": "9"]
    
    var answer = s
    for (key, value) in numDictionary {
        answer = answer.replacingOccurrences(of: key, with: value)
    }
    
    return Int(answer)!
}

let a = solution("one4seveneight")
print(a)
let b = solution("23four5six7")
print(b)
let c = solution("2three45sixseven")
print(c)
let d = solution("123")
print(d)
