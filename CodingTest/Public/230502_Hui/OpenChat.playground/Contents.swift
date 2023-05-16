import Foundation

//25~32번 시간초과
//record의 길이는 1 이상 100,000 이하이다.
func solution(_ record:[String]) -> [String] {
    var dicRec = [String : String]() //[UID : NAME]
    var test = [[String]]()
    var result = [String]()
    
    //UID별 최종 닉네임 도출
    for n in record {
        var dic = n.split(separator: " ").compactMap{String($0)}

        if dic[0] == "Enter" || dic[0] == "Change" {
            dicRec.updateValue(dic[2], forKey: dic[1])
        }
    }
    print(dicRec)
    
    //닉네임대로 Enter, Leave 작업 ( 중첩 for : 시간초과 )
    for i in record {
        var com = i.components(separatedBy: " ")
            
        for (k,v) in dicRec {
            switch com[0] {
            case "Enter" :
                if com[1] == k {
                    result.append("\(v)님이 들어왔습니다.")
                }
            case "Leave" :
                if com[1] == k {
                    result.append("\(v)님이 나갔습니다.")
                }
            default :
                break
            }
        }
    }
    
    print(result)
    return result
}

solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"])
