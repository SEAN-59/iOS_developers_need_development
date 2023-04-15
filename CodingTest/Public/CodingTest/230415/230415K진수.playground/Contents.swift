import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    var result = 0
   
    let primes = String(n, radix: k)
                    .components(separatedBy: "0")
                    .compactMap { Int($0) }
    print(primes)
    
    for item in primes {
        if isPrime(num: item) {
            result += 1
        }
    }

    return result
}

func isPrime(num: Int) -> Bool {
    if (num < 4) {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if (num % i == 0) { return false }
    }
    return true
}


solution(437674, 3) == 3
solution(110011, 10) == 2
