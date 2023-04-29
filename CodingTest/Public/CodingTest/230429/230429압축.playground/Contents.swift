import Foundation

func solution(_ msg:String) -> [Int] {
    var dictionary = [String: Int]()
    var index = 0
    for i in (UnicodeScalar("A").value...UnicodeScalar("Z").value){
        index += 1
        dictionary[String(UnicodeScalar(i)!)] = index
    }
    
    var result = [Int]()
    var w = ""
    for c in msg {
        let wc = w + String(c)
        if dictionary[wc] != nil {
            w = wc
        } else {
            result.append(dictionary[w]!)
            dictionary[wc] = index + 1
            index += 1
            w = String(c)
        }
    }
    result.append(dictionary[w]!)
    return result
}

solution("KAKAO") == [11, 1, 27, 15]
solution("TOBEORNOTTOBEORTOBEORNOT") == [20, 15, 2, 5, 15, 18, 14, 15, 20, 27, 29, 31, 36, 30, 32, 34]
solution("ABABABABABABABAB") == [1, 2, 27, 29, 28, 31, 30]
