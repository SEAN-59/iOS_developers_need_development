import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    let set1 = getString(str: str1.uppercased())
    let set2 = getString(str: str2.uppercased())
    print(set1, set2)
    
    let intersection = getIntersection(set1: set1, set2: set2)
    let union = getUnion(set1: set1, set2: set2)
    print(intersection, union)
    
    // 공집합인 경우
    if union.isEmpty {
        return 65536
    }
    
    let similarity = Double(intersection.count) * 65536 / Double(union.count)
    return Int(similarity)
}

func getString(str: String) -> [String] {
    var returnStringArray = [String]()
    let strArray = Array(str)
    
    for i in 0..<strArray.count-1 {
        let char1 = String(strArray[i])
        let char2 = String(strArray[i+1])
        
        // 알파벳으로 이루어진 글자 쌍인 경우에만 다중집합에 추가
        if char1.range(of: "[A-Z]", options: .regularExpression) != nil &&
            char2.range(of: "[A-Z]", options: .regularExpression) != nil {
            returnStringArray.append(char1 + char2)
        }
    }
    
    return returnStringArray
}


func getIntersection(set1: [String], set2: [String]) -> [String] {
    var intersection = [String]()
    
    for str in set1 {
        if set2.contains(str) {
            intersection.append(str)
        }
    }
    
    return intersection
}

func getUnion(set1: [String], set2: [String]) -> [String] {
    var union = set1
    
    for str in set2 {
        if !union.contains(str) {
            union.append(str)
        }
    }
    
    return union
}

solution("FRANCE", "french") == 16384
solution("handshake", "shake hands") == 65536
solution("aa1+aa2", "AAAA12") == 43690 // 으아아
solution("E=M*C^2", "e=m*c^2") == 65536
solution("abab", "baba") == 32768 // 으아아아
