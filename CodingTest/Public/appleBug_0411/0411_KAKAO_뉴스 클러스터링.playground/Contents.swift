import Foundation
// 22:19 ~ 23:59

func solution(_ str1:String, _ str2:String) -> Int {
    // 자카드 유사도 : 두 집합의 교집합 크기를 두집합의 합집합 크기로 나눈값
    // ex) {1,2,3} , {2,3,4} -> {2,3}, {1,2,3,4} -> 2 / 4 = 0.5
    // str1, str2 를 두글자씩 끊어서 다중집합으로 만들고 자카드 유사도 확인
    // 유사도에 65536을 곱하고 버림
    
    // 1.str을 다중집합으로 만듬[^0-9a-z._-]
    let str1Array = Array(str1)
    let str2Array = Array(str2)
//    print(str1Array, str2Array)
    
    var multiArray1: Array<String> = []
    var multiArray2: Array<String> = []
    
    for idx in 0 ..< str1Array.count - 1 {
        if str1Array[idx].isLetter && str1Array[idx+1].isLetter {
            multiArray1.append("\(str1Array[idx].lowercased())\(str1Array[idx+1].lowercased())")
        }
    }
    
    for idx in 0 ..< str2Array.count - 1 {
        if str2Array[idx].isLetter && str2Array[idx+1].isLetter {
            multiArray2.append("\(str2Array[idx].lowercased())\(str2Array[idx+1].lowercased())")
        }
    }
    
    if multiArray1.isEmpty && multiArray2.isEmpty {
        return 65536
    }
    
    multiArray1.sort()
    multiArray2.sort()
    
    var dupCase1 = 1
    if multiArray1.count > 0 {
        for idx in 0 ..< multiArray1.count - 1 {
            if multiArray1[idx] == multiArray1[idx+1] {
                multiArray1[idx] = "\(multiArray1[idx])_\(dupCase1)"
                dupCase1 += 1
            } else {
                dupCase1 = 1
            }
        }
    }
    
    var dupCase2 = 1
    if multiArray2.count > 0 {
        for idx in 0 ..< multiArray2.count - 1 {
            if multiArray2[idx] == multiArray2[idx+1] {
                multiArray2[idx] = "\(multiArray2[idx])_\(dupCase2)"
                dupCase2 += 1
            } else {
                dupCase2 = 1
            }
        }
    }
    
    print(multiArray1, multiArray2)
    print( "intersection",
           Set(multiArray1).intersection(Set(multiArray2))
    )
    print( "union",
        Set(multiArray1).union(Set(multiArray2))
    )
    let intersectionCount = Double(Set(multiArray1).intersection(Set(multiArray2)).count)
    let unionCount = Double(Set(multiArray1).union(Set(multiArray2)).count)
    
    
//    print(multiArray1, multiArray2)
//    print("union : ", union(array1: multiArray1, array2: multiArray2))
//    print("inter : ", intersection(array1: multiArray1, array2: multiArray2))
//    print(multiArray1.intersection(multiArray2))
//    print(multiArray1.union(multiArray2))
//    multiArray1.intersection(multiArray2)
//
//    let intersectionCount = Double(intersection(array1: multiArray1, array2: multiArray2).count)
//    let unionCount = Double(union(array1: multiArray1, array2: multiArray2).count)
////
    print(intersectionCount, unionCount, intersectionCount/unionCount)
    return Int(floor(intersectionCount/unionCount * 65536))
}

func union(array1: [String], array2: [String]) -> [String] {
    var result = [String]()
    if array1.count >= array2.count {
        result = array1
        for i in array2 {
            if !array1.contains(i) {
                result.append(i)
            }
        }
    } else {
        result = array2
        for i in array1 {
            if !array2.contains(i) {
                result.append(i)
            }
        }
    }
    return result
}

func intersection(array1: [String], array2: [String]) -> [String] {
    var result = [String]()
    for i in array1 {
        for j in array2 {
            if i == j {
                result.append(i)
                break
            }
        }
    }
    return result
}

solution("FRANCE", "french") // 16384
solution("handshake", "shake hands") // 65536
solution("aa1+aa2", "AAAA12") // 43690
solution("E=M*C^2", "e=m*c^2") // 65536
solution("aaa", "bbb") // 0
solution("abab", "baba") // 32768
solution("bb", "aa") //
solution("bbbbbbb", "aaaaaa") //
solution("E=M*C^2", "aaaa") // 65536


