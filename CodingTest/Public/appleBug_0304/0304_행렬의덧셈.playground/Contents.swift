
// 0303_ 11:37 ~ 11: 46
import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    
    return zip(arr1, arr2).map {
//        let count = $0.count
//        var temp = [Int]()
//        for i in 0..<count {
//            temp.append($0[i] + $1[i])
//        }
//        return temp
        zip($0, $1).map {
            $0 + $1
        }
    }
}

solution([[1,2],[2,3]], [[3,4],[5,6]])
solution([[1],[2]], [[3],[4]])
