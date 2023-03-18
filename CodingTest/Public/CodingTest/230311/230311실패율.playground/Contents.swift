import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    // 실패율 = 스테이지에 도달했으나 아직 클리어하지 못한 플레이어의 수 / 스테이지에 도달한 플레이어 수
    // 전체 스테이지 개수(1 <= N <= 500)
    // 게임을 이용하는 사용자가 현재 멈춰있는 스테이지의 번호가 담긴 배열(stages), stages.count = 1~200_000
    // 실패율이 같은 스테이지가 있다면 작은 번호의 스테이지가 먼저 오도록
    // 스테이지에 도달한 유저가 없는 경우 해당 스테이지 실패율 = 0
    var failure = [Int: Double]()
    var total = Double(stages.count) // 8.0
    var countArr = Array(repeating: 0, count: N+2) // [0, 0, 0, 0, 0, 0]

    for num in stages {
        countArr[num] += 1 // [0, 1, 3, 2, 1, 0, 1]
    }

    for i in 1..<N+1 {
        if countArr[i] == 0 {
            failure[i] = 0.0
        } else {
            total = total - Double(countArr[i])
            failure[i] = Double(countArr[i]) / total
        }
    }
    
    // 시간초과 나는 코드...
//     var failure = [Int: Double]()
//
//     for i in 1...N {
//         let players = stages.filter({ $0 >= i }).count
//         let clear = stages.filter({ $0 > i }).count
//         failure[i] =  Double(players - clear) / Double(players)
//     }
    
    let sortArr = failure.sorted(by: <).sorted(by: { $0.1 > $1.1 })
    let result = sortArr.map{ $0.key }

    return result
}

solution(5, [2,1,2,6,2,4,3,3]) == [3,4,2,1,5]
solution(4, [4,4,4,4,4]) == [4,1,2,3]
