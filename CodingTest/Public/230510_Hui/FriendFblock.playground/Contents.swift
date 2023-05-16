import Foundation

//블록이 지워진 후에 위에 있는 블록이 아래로 떨어져 빈 공간을 채우게 된다. <= 이부분꼬임
func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var box = [[String]](repeating: Array(repeating: ".",count: n), count: m)
    var cut = [String]()
    var count = 0
    
    //행렬제작
    for y in 0..<m {
        for (x,value) in board[y].enumerated() {
            box[y][x] = String(value)
        }
    }
    
    for y in 0..<m-1 {
        for x in 0..<n-1 {
            if box[y][x] == box[y][x+1] && box[y][x] == box[y+1][x] && box[y][x] == box[y+1][x+1] { //가로,세로,대각선
                //겹친부분이있는지 파악 (가로,세로,대각선(오른쪽))
                if y<m-2 && x<n-2 && box[y][x] == box[y][x+2] && box[y][x] == box[y][x+2] {
                    print("가로")
                    count += 6
                    
                    if y > 0 {
                        box[y+1][x] = box[y-1][x]
                        box[y+1][x+1] = box[y-1][x+1]
                        box[y+1][x+2] = box[y-1][x+2]
                        
                        box[y-1][x] = "0"
                        box[y-1][x+1] = "0"
                        box[y-1][x+2] = "0"
                        box[y][x] = "0"
                        box[y][x+1] = "0"
                        box[y][x+2] = "0"
                     }
                } else if y<m-2 && x<n-2 && box[y][x] == box[y+2][x] && box[y][x] == box[y+2][x+1] {
                    print("세로")
                    count += 6
                    
                    if y > 0 {
                        box[y+2][x] = box[y-1][x]
                        box[y+2][x+1] = box[y-1][x+1]
                        
                        box[y][x] = "0"
                        box[y+1][x] = "0"
                        box[y+2][x] = "0"
                        box[y][x+1] = "0"
                        box[y+1][x+1] = "0"
                        box[y+2][x+1] = "0"
                     }
                } else if y<m-2 && x<n-2 && box[y][x] == box[y+1][x+2] && box[y][x] == box[y+2][x+1] && box[y][x] == box[y+2][x+2] {
                    print("대각선")
                    count += 7
                    
                    if y > 0 {
                        box[y+1][x] = box[y-1][x]
                        box[y+2][x+1] = box[y-1][x+1]
                        box[y+2][x+2] = box[y][x+2]
                        box[y+1][x+2] = box[y-1][x+2]
                        
                        box[y][x] = "0"
                        box[y][x+1] = "0"
                        box[y+1][x] = "0"
                        box[y+1][x+1] = "0"
                        box[y+1][x+2] = "0"
                        box[y+2][x+1] = "0"
                        box[y+2][x+2] = "0"
                    }
                } else {
                    print("4")
                    count += 4
                    
                    for ym in (0..<m-2).reversed() {
                        box[ym+2][x] = box[ym][x]
                        box[ym+2][x+1] = box[ym][x+1]
                        
                        box[ym][x] = "0"
                        box[ym][x+1] = "0"
                    }
                }
            }
        }
    }
    
    print(box)
    print(count)
    
    return count
}

//solution(4, 5, ["CCBDE", "AAADE", "AAABF", "CCBBF"]) //14
//solution(6, 6, ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMF", "TMMTTJ"]) //15
solution(8, 5, ["HGNHU", "CRSHV", "UKHVL", "MJHQB", "GSHOT", "MQMJJ", "AGJKK", "QULKK"])
