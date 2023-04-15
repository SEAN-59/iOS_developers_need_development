import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    let set1 = getString(str: str1.uppercased())
    let set2 = getString(str: str2.uppercased())
//    print(set1, set2)
    
    
    let intersection = Set(set1).intersection(Set(set2))
    let union = Set(set1).union(Set(set2))
//    print(intersection, union)
    
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
        let char1 = strArray[i]
        let char2 = strArray[i+1]
        
        // 알파벳으로 이루어진 글자 쌍인 경우에만 다중집합에 추가
        if char1.isLetter && char2.isLetter {
//        if char1.range(of: "[A-Z]", options: .regularExpression) != nil &&
//            char2.range(of: "[A-Z]", options: .regularExpression) != nil {
            returnStringArray.append(String(char1) + String(char2))
        }
    }
    
    if !returnStringArray.isEmpty {
        returnStringArray.sort()
        var count = 1
        for index in 0..<returnStringArray.count - 1 {
            if returnStringArray[index] == returnStringArray[index + 1] {
                returnStringArray[index] = returnStringArray[index] + "_\(count)"
                count += 1
            } else {
                count = 1
            }
        }
    }
    
    return returnStringArray
}

solution("FRANCE", "french") == 16384
solution("handshake", "shake hands") == 65536
solution("aa1+aa2", "AAAA12") == 43690 // 으아아
solution("E=M*C^2", "e=m*c^2") == 65536
solution("abab", "baba") == 32768//65536 // 으아아아
