import Foundation

//04.23
func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var campStr = [String]()
    var result = ""
    
    for i in 0...t*m { //인원수만큼 숫자총갯수 조절
        for j in String(i, radix: n) {
            if campStr.count != t*m {
                campStr.append(String(j))
            }
        }
    }
    
    for n in stride(from: p-1, to: campStr.count, by:m) {
        if result.count != t {
            result.append(campStr[n])
        }
    }

    return result.uppercased()
}

//진법 n, 미리 구할 숫자의 갯수 t, 게임에 참가하는 인원 m, 튜브의 순서 p
solution(2, 4, 2, 1)
//solution(16, 16, 2, 1)
