import Foundation

// 16:08 ~ 18:15
func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    // queue : FIFO
    // pop : 배열의 첫번쨰 원소 추출
    // insert : 배열의 끝에 추가
    
//    var test = queue1
//
//    print(test)
//    print(test.dropFirst())
//    print(test)
    
    let num1 = queueSum3(queue1: queue1, queue2: queue2)
    let num2 = queueSum3(queue1: queue2, queue2: queue1)
    print(num1, num2)
//    print(num1 == -1 || num2 == -1 ? max(num1, num2) : min(num1, num2))
//    return min(num1, num2)
//    return num1
    return num1 == -1 || num2 == -1 ? max(num1, num2) : min(num1, num2)
}

// MARK: queue변화 방식 1
func queueSum(queue1: [Int], queue2: [Int]) -> Int {
    var changeQueue1 = queue1
    var changeQueue2 = queue2
    let fullQueueSum = queue1.reduce(0) { $0 + $1 } + queue2.reduce(0) { $0 + $1 }
    
    if fullQueueSum % 2 == 1 {
        return -1
    }
    var result = 0
    
    while true {
        let queueSum = changeQueue1.reduce(0) { $0 + $1 }
        
        if queueSum < (fullQueueSum / 2) {
            changeQueue1.append(changeQueue2.remove(at: 0))
            
        } else if queueSum > (fullQueueSum / 2) {
            changeQueue2.append(changeQueue1.remove(at: 0))
        } else {
            break
        }
        
        if changeQueue1 == queue1 || changeQueue2 == queue2 {
            result = -1
            break
        }
        result += 1
    }
    
    return result
}
// MARK: queue변화 방식 2
func queueSum2(queue1: [Int], queue2: [Int]) -> Int {
    var changeQueue1 = queue1
    var changeQueue2 = queue2
    
    var queue1Sum = queue1.reduce(0) { $0 + $1 }
    var queue2Sum = queue2.reduce(0) { $0 + $1 }
    let fullQueueSum = queue1Sum + queue2Sum
    
    if fullQueueSum % 2 == 1 {
        return -1
    }
    var result = 0
    
    while queue1Sum != fullQueueSum / 2  {
        if queue1Sum < (fullQueueSum / 2) {
            let popFirst = changeQueue2[0]
            queue1Sum += popFirst
            changeQueue1.append(popFirst)
            
            changeQueue2 = Array(changeQueue2.dropFirst())
            
        } else if queue1Sum > (fullQueueSum / 2) {
            let popFirst = changeQueue1[0]
            queue1Sum -= popFirst
            changeQueue2.append(popFirst)
            changeQueue1 = Array(changeQueue1.dropFirst())
        } else {
            break
        }
        
        if changeQueue1 == queue1 || changeQueue2 == queue2 {
            result = -1
            break
        }
        result += 1
    }
    
    return result
}

// MARK: Two Pointer 방식
func queueSum3(queue1: [Int], queue2: [Int]) -> Int {
    let newQueue = queue1 + queue2
    
    var queue1Sum = queue1.reduce(0) { $0 + $1 }
    var queue2Sum = queue2.reduce(0) { $0 + $1 }
    let fullQueueSum = queue1Sum + queue2Sum
    
    if fullQueueSum % 2 == 1 {
        return -1
    }
    let halfQueueSum = fullQueueSum / 2
    
    var leftPointer = 0
    var rightPointer = queue1.count
    
    var result = 0
    
    while leftPointer < rightPointer && rightPointer < newQueue.count {
//        print(leftPointer, rightPointer)
        if queue1Sum < halfQueueSum {
            queue1Sum += newQueue[rightPointer]
            rightPointer += 1
        } else if queue1Sum > halfQueueSum {
            queue1Sum -= newQueue[leftPointer]
            leftPointer += 1
        } else {
            break
        }
        result += 1
    }
    
    if queue1Sum != halfQueueSum {
        return -1
    }
    return result
}

//solution([3,2,7,2], [4,6,5,1])
solution([1,2,1,2], [1,10,1,2])
//solution([1,1], [1,5])
//solution([1, 4], [4, 8])
solution([1, 10, 1, 2], [1, 2, 1, 2])
//solution([1, 2, 4], [3, 2, 4])
//solution([ 1, 1, 1, 1, 1, 1, 1, 1, 1, 10 ], [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ])
solution([1, 1, 1, 8, 10, 9], [1, 1, 1, 1, 1, 1])
solution([101, 100], [102, 103])

//func solution2(_ queue1:[Int], _ queue2:[Int]) -> Int {
//    var answer = 0
//
//    var first = queue1
//    var second = queue2
//
//    var firstSum = first.reduce(0, +)
//    var secondSum = second.reduce(0, +)
//
//    var pointer1 = 0
//    var pointer2 = 0
//
//   while answer < 1000000 {
//
//       if firstSum > secondSum {
//           firstSum -= first[pointer1]
//           secondSum += first[pointer1]
//           second.append(first[pointer1])
//           pointer1 += 1
//       } else if firstSum < secondSum {
//           secondSum -= second[pointer2]
//           firstSum += second[pointer2]
//           first.append(second[pointer2])
//           pointer2 += 1
//       } else {
//           return answer
//       }
//
//       answer += 1
//   }
//
//    return -1
//}

//solution([3,2,7,2], [4,6,5,1])
//solution([1,2,1,2], [1,10,1,2])
//solution2([1,1], [1,5])
//solution([1, 4], [4, 8])
//solution2([1, 10, 1, 2], [1, 2, 1, 2])
//solution2([1, 1, 1, 8, 10, 9], [1, 1, 1, 1, 1, 1])
//solution2([1, 10, 1, 2], [1, 2, 1, 2])
