
import Foundation

// 14:10 ~ 14:55
func solution(_ survey:[String], _ choices:[Int]) -> String {
//    survey :
//    1. R || T
//    2. C || F
//    3. J || M
//    4. A || N
//    choices :
//    1    매우 비동의 (왼)
//    2    비동의 (왼)
//    3    약간 비동의 (왼)
//    4    모르겠음
//    5    약간 동의 (오)
//    6    동의 (오)
//    7    매우 동의 (오)
    var indicators: [String: Int] = [
        "RT": 0,
        "CF": 0,
        "JM": 0,
        "AN": 0,
    ]
    let leftType = ["R","C","J","A"]
    for (chara, score) in zip(survey, choices) {
//        print(chara, score)
        switch score {
        case 1...3:
            // 비동의 (첫번째 글자 점수)
            let type = String(chara.prefix(1))
            let tempIndi = String(chara.sorted { $0 < $1 })
            
            if leftType.contains(String(type)) {
//                1->3
//                2->2
//                3->1
                print("비동의",type, (-score + 4))
                indicators[tempIndi]! += (-score + 4)
            } else {
//                1->-3
//                2->-2
//                3->-1
                print("비동의",type, (score - 4))
                indicators[tempIndi]! += (score - 4)
            }
        case 5...7:
            // 동의 (두번째 글자 점수)
            let type = String(chara.suffix(1))
            let tempIndi = String(chara.sorted { $0 < $1 })
            if leftType.contains(String(type)) {
//                5->1
//                6->2
//                7->3
                print("동의",type, (score - 4))
                indicators[tempIndi]! += (score - 4)
            } else {
//                5->-1
//                6->-2
//                7->-3
                print("동의",type, (-score + 4))
                indicators[tempIndi]! += (-score + 4)
            }
        default:
            print(chara, score)
            // 모르겠음 (무점수)
        }
    }
    print(indicators)
    
    var result = ""
    if indicators["RT"]! >= 0 {
        result += "R"
    } else {
        result += "T"
    }
    if indicators["CF"]! >= 0 {
        result += "C"
    } else {
        result += "F"
    }
    if indicators["JM"]! >= 0 {
        result += "J"
    } else {
        result += "M"
    }
    if indicators["AN"]! >= 0 {
        result += "A"
    } else {
        result += "N"
    }
    
    return result
}
solution(["AN", "CF", "MJ", "RT", "NA"], [5, 3, 2, 7, 5]) // "TCMA"
solution(["TR", "RT", "TR"], [7, 1, 3]) // "RCJA"

