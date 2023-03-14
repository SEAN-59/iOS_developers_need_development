import Foundation

func Board(_ board:[[Int]], _ moves:[Int]) -> Int {
    var clawboard = board
    var basket = [Int]()
    var count = 0
    
    for i in moves.indices { //0..<8
        
        basket.insert(0, at: i) //해당 세로값에 인형이없으면 insert하면 안됨..
        
        for j in board.indices { //0..<5
            //print(clawboard[j][moves[i]-1]) //0 0 0 4 3 -> 0 3 1 2 1 -> 0 1 5 4 1 ...
            
            //탐색하다가 인형이있으면(0이아니면) 값을 basket에 넣고 board는 0으로
            if clawboard[j][moves[i]-1] != 0 {
                basket[i] = clawboard[j][moves[i]-1]
                clawboard[j][moves[i]-1] = 0
                break
            }
            
            //이때 basket의 스택에 같은 인형이 겹쳐있다면 삭제하고 count+=2
//            if basket[i] == basket[i+1] {
//                basket.remove(at: i)
//                basket.remove(at: i+1)
//                count += 2
//            }
        }
    }
    //인형이없으면 아무일도 일어나지 않아야함 -> index out of range 난다고 basket index에 moves index 길이 만큼 값을 줘버려서 중간에 값이생김.
    print(basket)

    
    return count
}

Board([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4]) //4
//[0 1 2 3 4]
//0 0 0 0 0
//0 0 1 0 3
//0 2 5 0 1
//4 2 4 4 2
//3 5 1 3 1
