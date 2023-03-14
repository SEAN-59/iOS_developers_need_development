import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    
    //행, 열 전환
    var likeStackArr = [[Int]](repeating: Array(repeating: 0, count: board.count), count: board[0].count)
    for row in 0..<board.count {
        for col in 0..<board[0].count {
            likeStackArr[col][row] = board[board.count - (row + 1)][col]
        }
    }
//    print(likeStackArr)
    
    // 0 제거
    var intArr = [[Int]]()
    for items in likeStackArr {
        intArr.append(items.filter { $0 != 0 })
    }
//    print(intArr)
    
    var answer = 0
    var crainedItems = [Int]()
    for row in moves {
        if let outputItem = intArr[row - 1].popLast() {
            print(intArr)
            print(outputItem)
            if crainedItems.last == outputItem {
                answer += 2
                crainedItems.popLast()
            } else {
                crainedItems.append(outputItem)
            }
        }
    }
        
    return answer
}

solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4]) == 4
