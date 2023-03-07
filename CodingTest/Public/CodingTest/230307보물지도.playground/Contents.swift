import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    
    var str1 = [String]()
    arr1.forEach {
        str1.append(String($0, radix: 2))
    }
    
    var str2 = [String]()
    arr2.forEach {
        str2.append(String($0, radix: 2))
    }
    
    var intArr = [Int]()
    for index in 0..<str1.count {
        intArr.append( Int(str1[index])! + Int(str2[index])! )
    }
    
    var answer: [String] = []
    
    for index in 0..<intArr.count {
        var wall = ""
        
        let losingBlank = intArr.count - String(intArr[index]).count
        
        if losingBlank > 0 {
            for _ in 0..<losingBlank {
                wall += " "
            }
            
        }
        
        for item in String(intArr[index]) {
            wall.append(Int(String(item))! > 0 ? "#" : " ")
        }
        
        answer.append(wall)
    }
    
    return answer
}
