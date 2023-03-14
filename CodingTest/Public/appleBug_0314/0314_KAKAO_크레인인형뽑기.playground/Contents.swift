import Foundation
// 0313 16:45 ~ 17:25
func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board = board
    var resultList = [Int]()
    var result = 0
    for move in moves { // 뽑아올 위치 가져옴
        for idx in 0 ..< board.count { // 보드를 한줄씩 가져옴
            if board[idx][move-1] != 0 { // 보드의 한줄중 뽑아올 수가 0이 아닌경우 에만 실행
                print(resultList, board[idx][move-1])
                if resultList.last == board[idx][move-1] { // 결과 리스트의 마지막 수와 뽑아온 수가 같으면 마지막 수 삭제 & 삭제된 값 + 2
                    result += 2
                    resultList.popLast()
                } else {
                    // 같지않으면 결과리스트에 append
                    resultList.append(board[idx][move-1])
                }
                // 뽑아온 위치의 수 0으로 변경
                board[idx][move-1] = 0
                break
            }
        }
    }
    return result
}


solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4]) // 4
