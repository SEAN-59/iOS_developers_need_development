import Foundation

// 21:50 ~ 22:05
func solution(_ s:String) -> [Int] {
    // 텍스트 나눌수 있도록 전처리
    var s = s.replacingOccurrences(of: "{{", with: "")
    s = s.replacingOccurrences(of: "}}", with: "")

    print(s)
    // 텍스트 배열로 분리
    let sepString = s.components(separatedBy: "},{")
    // 이중배열로 변환 및 작은 순으로 정렬
    let sortedSepArray = sepString.map {
        $0.components(separatedBy: ",")
    }.sorted { $0.count < $1.count }
    print(sortedSepArray)
    
    var result: [String] = []
    // 작은 순서대로 result에 값이 없으면 추가
    for sepArray in sortedSepArray {
        for sep in sepArray {
            if result.contains { $0 == sep } {
//                result.append(sep)
            } else {
                result.append(sep)
            }
        }
    }
    
    return result.map { Int($0) ?? 0 }
}

solution("{{2},{2,1},{2,1,3},{2,1,3,4}}") // [2, 1, 3, 4]
solution("{{1,2,3},{2,1},{1,2,4,3},{2}}") // [2, 1, 3, 4]
solution("{{20,111},{111}}") // [111, 20]
solution("{{123}}") // [123]
solution("{{4,2,3},{3},{2,3,4,1},{2,3}}") // [3, 2, 4, 1]
