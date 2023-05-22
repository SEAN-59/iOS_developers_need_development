import Foundation

// 18:18 ~ 19:10
func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var result: [String] = []
    for c in course {
        result += getMenuCombine(orders: orders, num: c)
    }
    
    return result.sorted(by: <)
}

func getMenuCombine(orders: [String], num: Int) -> [String] {
    
    var menuDict: [String: Int] = [:]
    
    for order in orders {
        let orderArray = Array(order).map{ String($0) }
        
        if orderArray.count < num {
            continue
        }
        for i in combination(orderArray, num) {
            let sortedOrder = i.sorted(by: { $0 < $1})
            if menuDict[sortedOrder.joined(separator: "")] == nil {
                menuDict[sortedOrder.joined(separator: "")] = 1
            } else {
                menuDict[sortedOrder.joined(separator: "")]! += 1
            }
        }
    }
    
    let sortedMenuDict = menuDict.sorted(by: { $0.value > $1.value})
    print(sortedMenuDict)
    let maxValue = max(sortedMenuDict.first?.value ?? 0, 2)
    var result: [String] = []
    for (k,v) in sortedMenuDict {
        if v == maxValue {
            result.append(k)
        } else {
            break
        }
    }
    print(result)
    
    return result
}

solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4])
solution(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2,3,5])
solution(["XYZ", "XWY", "WXA"], [2,3,4])

func combination<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    // 배열의 갯수가 조합의 갯수보다 작은경우 처리
    if array.count < n { return result }

    var stack = array.enumerated().map { ([$0.element], $0.offset) }
    
    while stack.count > 0 {
//        print("-------")
        let now = stack.removeLast()

        let elements = now.0
        let index = now.1
//        print("elements :", elements)
//        print("index    :", index)
        if elements.count == n {
            result.append(elements.sorted())
            continue
        }

        guard index+1 <= array.count-1 else {
//            print("guard else")
            continue
        }

        for i in index+1...array.count-1 {
//            print("for      :", elements, [array[i]], i)
            stack.append((elements + [array[i]], i))
        }
//        print(stack)
    }

    return result
}


//combination([111,222,333,444,555,666], 3)
