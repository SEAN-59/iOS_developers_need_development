import Cocoa

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var answer = ""
    var text = ""
    var num = 0
    
    while text.count < t * m {
        text += String(num, radix: n)
        num += 1
    }
    
    for idx in 0..<t {
        let index = (idx * m) + (p - 1)
        answer += String(text[text.index(text.startIndex, offsetBy: index)])
    }
    
    return answer.uppercased()
}

solution(2, 4, 2, 1) == "0111"
solution(16, 16, 2, 1) == "02468ACE11111111"
solution(16, 16, 2, 2) == "13579BDF01234567"
