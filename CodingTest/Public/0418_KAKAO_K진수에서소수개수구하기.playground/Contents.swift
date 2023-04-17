import Foundation
// 18:04~
func solution(_ n:Int, _ k:Int) -> Int {
    /*
        0P0 처럼 소수 양쪽에 0이 있는 경우
        P0  처럼 소수 오른쪽에만 0이 있고 왼쪽에는 아무것도 없는 경우
        0P  처럼 소수 왼쪽에만 0이 있고 오른쪽에는 아무것도 없는 경우
        P   처럼 소수 양쪽에 아무것도 없는 경우
    */
    
    let radixNumber = String(n, radix: k)
    print(radixNumber)
    
    let sepNumber = radixNumber.components(separatedBy: "0").filter { $0 != "" }
    
    var result = 0
    for number in sepNumber {
        let number = Int(number) ?? 0
        print(number, isPrime(number))
        if isPrime(number) {
            result += 1
        }
    }
    
    
    return result
}

func isPrime(_ n: Int) -> Bool {
    guard n >= 2     else { return false } // 2미만인 경우 false
    guard n != 2     else { return true  } // 2인경우 true
    guard n % 2 != 0 else { return false } // 2의 배수인경우 false
    return !stride(from: 3, through: Int(sqrt(Double(n))), by: 2).contains { n % $0 == 0 } // 3부터 시작하며, 2씩 뛰어넘으며 판단 -> 에라토스테네스의 체
}


solution(437674, 3) == 3
solution(110011, 10) == 2
solution(999999, 10) == 0
