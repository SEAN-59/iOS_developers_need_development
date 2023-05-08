import Foundation
// 22:40 ~ 23:41
func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var boardArray = board.map { Array($0) }
    var result = 0
    
    while true {
        var deletePoint: Set<[Int]> = Set()
        for row in 0..<m-1 {
            for col in 0..<n-1 {
                // 사각형으로 모두 같은 경우
                if boardArray[row][col] != "0" &&
                    boardArray[row][col] == boardArray[row][col+1] &&
                    boardArray[row][col] == boardArray[row+1][col] &&
                    boardArray[row][col] == boardArray[row+1][col+1] {
                    
                    deletePoint.insert([row,col])
                    deletePoint.insert([row+1,col])
                    deletePoint.insert([row,col+1])
                    deletePoint.insert([row+1,col+1])
                }
            }
        }
        // 삭제할 포인트가 없는 경우 종료
        if deletePoint.isEmpty {
            break
        }
        
        // 지우기
        print("deletePoint: ", deletePoint)
        for point in deletePoint {
            boardArray[point[0]][point[1]] = "0"
            result += 1
        }
        
        for i in boardArray {
            print(i)
        }
        
        // 아래로 땡기기
        for row in (0..<m-1).reversed() {
            for col in 0..<n {
                if boardArray[row][col] != "0" &&
                    boardArray[row+1][col] == "0" {
                    // 0의 맨 아래로 땡기기 위한 로우 조정
                    var changeRow = row+1
                    for k in row+1..<m {
                        if boardArray[k][col] == "0" {
                            changeRow = k
                        }
                    }
                    // 조정된 로우 와 선택된 로우값 변경
                    boardArray[changeRow][col] = boardArray[row][col]
                    // 선택된 로우값 0으로 변경
                    boardArray[row][col] = "0"
                }
            }
        }
        print("VVVVVVVV")
        for i in boardArray {
            print(i)
        }
        print("----")
    }
    return result
}

solution(4, 5, ["CCBDE",
                "AAADE",
                "AAABF",
                "CCBBF"])
solution(6, 6, ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMF", "TMMTTJ"])
solution(2, 2, ["TT", "RR"])
solution(2, 2, ["TT", "TT"])
solution(3, 3, ["TTT", "TTT", "TTT"])
solution(4, 4, ["TTTT", "TTTT", "TTTT", "TTTT"])
solution(4, 5, ["CCBDE",
                "AAADE",
                "AAABD",
                "CCBBD"])

//solution(30, 30, Array(repeating: String(repeating: "T", count: 30), count: 30))
