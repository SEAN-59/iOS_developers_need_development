import Foundation

func solution(_ s:String) -> [Int] {
    // 문자열에서 필요없는 문자 제거
    let s = s.dropFirst(2).dropLast(2).components(separatedBy: "},{")

    // 길이 순으로 정렬
    let sortedS = s.sorted { $0.count < $1.count }
    var answer: [Int] = []
    for item in sortedS {
        // 쉼표로 구분된 숫자들을 배열로 변환
        let numbers = item.split(separator: ",").map { Int($0)! }
        for num in numbers {
            // 이미 결과 배열에 포함되어있지 않으면 추가
            if !answer.contains(num) {
                answer.append(num)
            }
        }
    }
    return answer
}

solution("{{2},{2,1},{2,1,3},{2,1,3,4}}") == [2, 1, 3, 4]
solution("{{1,2,3},{2,1},{1,2,4,3},{2}}") == [2, 1, 3, 4]
solution("{{20,111},{111}}") == [111, 20]
solution("{{123}}") == [123]
solution("{{4,2,3},{3},{2,3,4,1},{2,3}}") == [3, 2, 4, 1]
