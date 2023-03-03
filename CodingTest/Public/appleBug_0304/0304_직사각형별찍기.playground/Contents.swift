
// 0303_ 11:50 ~ 11: 55
import Foundation

func solution(_ n: String) -> String {
//    let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
    let n = n.components(separatedBy: [" "]).map { Int($0)! }
    let (a, b) = (n[0], n[1])
    var result = ""
    for i in 0 ..< b {
        for j in 0 ..< a {
            result += "*"
        }
        if i != (b-1) {
            result += "\n"
        }
    }
    print(result)
    return result
}

solution("5 3")
solution("2 2")
