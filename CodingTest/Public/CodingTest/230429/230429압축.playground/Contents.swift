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
            if let idx = dictionary[w] {
               result.append(idx)
            }
            dictionary[wc] = dictionary.count + 1
            w = String(c)
        }
    }
    if let idx = dictionary[w] {
       result.append(idx)
    }
    return result
}

solution("KAKAO") == [11, 1, 27, 15]
solution("TOBEORNOTTOBEORTOBEORNOT") == [20, 15, 2, 5, 15, 18, 14, 15, 20, 27, 29, 31, 36, 30, 32, 34]
solution("ABABABABABABABAB") == [1, 2, 27, 29, 28, 31, 30]
