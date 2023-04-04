import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    //id_list : 유저아이디리스트
    //report : 각이용자가 신고한 이용자의 ID정보가 담긴 문자열 배열
    //k : 정지기준
    var answer = [Int]()
    var totalMail = [String: Int]()
    var reportedMap = [String: Int]()
    id_list.forEach {
        totalMail[$0] = 0
        reportedMap[$0] = 0
    }
        
    //report를 하나로 합치자. -> Set
    let reportSet:Set<String> = Set(report)
    
    //누가 누굴 신고했는지 체크
    let finalReport = reportSet.map { $0.components(separatedBy: " ") }

    //누가 얼만큼 신고당했는지
    finalReport.forEach { reportedMap[$0[1]]! += 1 }

    //k회 이상 신고당한 사람에게 메일 +1
    // reportedMap.forEach {
    //     if $1 >= k {
    //         totalMail[$0]! += 1
    //     }
    // }

    //신고한 사람에게 메일 +1
    finalReport.forEach {
        let reportingUser = $0[0]
        let reportedUser = $0[1]
        let isBanned = reportedMap[reportedUser]! >= k
        if isBanned {
            totalMail[reportingUser]! += 1
        }
    }
        
    id_list.forEach {
        answer.append(totalMail[$0]!)
    }
    return answer
}
