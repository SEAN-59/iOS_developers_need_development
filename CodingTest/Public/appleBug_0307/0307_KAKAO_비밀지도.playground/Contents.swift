import Foundation
// 0306_ 18:40 ~ 19:06
func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
//    var radixArr1 = [String]()
//    var radixArr2 = [String]()
//
//    for i in arr1 {
//        var radix2 = String(i, radix: 2, uppercase: true)
//        if radix2.count != n {
//            let count = n - radix2.count
//            radix2 = String.init(repeating: "0", count: count) + radix2
//        }
//        radixArr1.append(radix2)
//    }
//
//    for i in arr2 {
//        var radix2 = String(i, radix: 2, uppercase: true)
//        if radix2.count != n {
//            let count = n - radix2.count
//            radix2 = String.init(repeating: "0", count: count) + radix2
//        }
//        radixArr2.append(radix2)
//    }
    
    let radixArr1 = arr1.map {
        var radix2 = String($0, radix: 2, uppercase: true)
        if radix2.count != n {
            let count = n - radix2.count
            radix2 = String.init(repeating: "0", count: count) + radix2
        }
        return radix2
    }
    
    let radixArr2 = arr2.map {
        var radix2 = String($0, radix: 2, uppercase: true)
        if radix2.count != n {
            let count = n - radix2.count
            radix2 = String.init(repeating: "0", count: count) + radix2
        }
        return radix2
    }
    
    print(radixArr1, radixArr2)

    for i in 0 ..< n {
        var row = ""
        for j in 0 ..< n {
//            print(i, j)
            
            if Array(radixArr1[i])[j] == "1" || Array(radixArr2[i])[j] == "1" {
                row += "#"
            } else {
                row += " "
            }
        }
        answer.append(row)
    }
    
    
    print(answer)
    return answer
}

solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28])
// ["#####","# # #", "### #", "# ##", "#####"]

solution(6, [46, 33, 33 ,22, 31, 50], [27 ,56, 19, 14, 14, 10])
// ["######", "### #", "## ##", " #### ", " #####", "### # "]

