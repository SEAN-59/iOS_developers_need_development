
// 0303_ 11:29 ~ 11:35
import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int {
    var totalPrice = 0
    
    for run in 1 ... count {
        totalPrice += price * run
    }
    
    let result = totalPrice - money
    
    
    return result > 0 ? result : 0
}

solution(3,20,4) // 10
solution(30,100000,2500) // 10
