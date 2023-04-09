import Foundation

// 18:44 ~ 19:15
func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    // 신고처리 시스템
    // 한번에 한명의 유저 신고
    // 신고횟수 제한 x
    // 동일한 유저에 대한 신고 1회로 처리
    // k회 이상 신고된 유저는 이용정지
    // 처리결과 메일을 받은 횟수를 리턴
    
    // 중복 처리
    let reportSet = Array(Set(report))
    
    // 정지 딕셔너리 초기화
    var banDict: [String: Int] = [:]
    // 유저 딕셔너리 초기화
    var reportDict: [String: Int] = [:]
    for id in id_list {
        reportDict[id] = 0
        banDict[id] = 0
    }
    
    
    // 1. [유저: 신고당한 횟수] 딕셔너리 제작
    for re in reportSet {
//        let reporter = re.components(separatedBy: " ")[0] // 신고자
        let reported = re.components(separatedBy: " ")[1] // 신고당한 자
        reportDict[reported]! += 1
    }
    print(reportDict)
    
    // 2. [신고자: 정지 먹인 횟수] 의 딕셔너리 제작
    for re in reportSet {
        let reporter = re.components(separatedBy: " ")[0] // 신고자
        let reported = re.components(separatedBy: " ")[1] // 신고당한 자
        if reportDict[reported]! >= k {
            banDict[reporter]! += 1
        }
    }
    print(banDict)
    // 3. 정지 먹인 횟수 갯수 정렬
    var result = [Int]()
    for id in id_list {
        result.append(banDict[id]!)
    }
    
    return result
}

solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2) // [2,1,1,0]

solution(["con", "ryan"], ["ryan con", "ryan con", "ryan con", "ryan con"], 3) // [0,0]
