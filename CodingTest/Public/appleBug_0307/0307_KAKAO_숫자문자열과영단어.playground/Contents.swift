import Foundation

// 0306_ 19:30 ~ 19:45

func solution(_ s:String) -> Int {
    var result = ""
    let numberList = ["zero","one","two","three","four","five","six","seven","eight","nine"]
    
    var startIdx = 0
    var endIdx = 0
    let sArray = Array(s)
    
    for (idx, cha) in sArray.enumerated() {
        
        print(idx, cha)
        print(sArray[startIdx...endIdx])
        if let _ = Int(String(cha)) {
            result += String(cha)
            startIdx = idx+1
            endIdx = idx+1
            continue
        }
        
        if numberList.contains(String(sArray[startIdx...endIdx])) {
            let number = numberList.firstIndex(of: String(sArray[startIdx...endIdx])) ?? 0
            result += "\(number)"
            startIdx = idx+1
            endIdx = idx+1
        } else {
            endIdx = idx+1
        }
    }
    print(result)
    
    return Int(result)!
}

solution("one4seveneight")
solution("23four5six7")
solution("2three45sixseven")
solution("123")
