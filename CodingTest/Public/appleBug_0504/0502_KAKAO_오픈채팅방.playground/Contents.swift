import Foundation

// 19:23 ~ 19:55
func solution(_ record:[String]) -> [String] {
    
    var result = [String]()
    
    var uuidDict = [String: String]()
    
    var changeList = [Int]()
    
    for (idx, i) in record.enumerated() {
        let sepRecord = i.components(separatedBy: " ")
        let state = sepRecord[0]
        
        if state == "Leave" {
            let uuid = sepRecord[1]
            result.append("\(uuid) 님이 나갔습니다.")
        } else if state == "Enter" {
            let uuid = sepRecord[1]
            let name = sepRecord[2]
            uuidDict[uuid] = name
            result.append("\(uuid) 님이 들어왔습니다.")
        } else {
            let uuid = sepRecord[1]
            let name = sepRecord[2]
            changeList.append(idx)
            uuidDict[uuid] = name
        }
    }
    
    print(result)
    print(uuidDict)
    
    var newResult: [String] = []
    for i in result {
        let a = i.components(separatedBy: " ")[0]
        print(uuidDict[a]! + i.components(separatedBy: " ")[1] + i.components(separatedBy: " ")[2])
        newResult.append(uuidDict[a]! + i.components(separatedBy: " ")[1] + " " + i.components(separatedBy: " ")[2])
    }
//    for (k, v) in uuidDict {
//        for idx in result.indices {
//            result[idx] = result[idx].replacingOccurrences(of: k, with: v)
//        }
//    }
    
//    print(result)
//    print(uuidDict)
    
    
    return newResult
}

solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]) == ["Prodo님이 들어왔습니다.", "Ryan님이 들어왔습니다.", "Prodo님이 나갔습니다.", "Prodo님이 들어왔습니다."]

//solution(["Enter 1 Muzi", "Enter 2 Prodo","Enter 3 aa","Enter 4 Prodo","Enter 5 Ryan"])

