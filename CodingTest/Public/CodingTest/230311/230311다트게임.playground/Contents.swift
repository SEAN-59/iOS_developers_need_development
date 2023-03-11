import Foundation

func solution(_ dartResult:String) -> Int {
    let numList = dartResult.split { $0.isLetter || $0 == "#" || $0 == "*" }.map { Int($0)! }
    let optionList = dartResult.split { $0.isNumber }
    
    var points = [0, 0, 0]
    
    for i in 0...2 {
        var score = 1
        var bonus = 1
        
        if optionList[i].first == "D" {
            bonus = 2
        } else if optionList[i].first == "T" {
            bonus = 3
        }
        
        for _ in 1...bonus {
            score *= numList[i]
        }
        
        if optionList[i].last == "*" {
            score *= 2
            
            if i >= 1 {
                points[i-1] *= 2
            }
            
        } else if optionList[i].last == "#" {
            score *= -1
        }
        
        points[i] = score
    }
    
    let answer = points.reduce(0){ $0 + $1 }
    
    return answer
}
