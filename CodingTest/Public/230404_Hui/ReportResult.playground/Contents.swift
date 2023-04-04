import Foundation

//23.04.04 RESET
//Dictionary특성때문에 결과값 인덱스가 순차적이지 못함..!!
func report(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {

    var reportCount = [String : Set<String>]() //[신고당함 : 신고자(id_list)]
    var finMail = [String : Int]()

    //finMail, reportCount.key작업
    for i in id_list.indices {
        finMail.updateValue(0, forKey: id_list[i])
        reportCount.updateValue(Set([]), forKey: id_list[i])
    }

    //분할작업 및 reportCount작업
    for j in report {
        var singoza = j.components(separatedBy: " ")[0] //신고자
        var singodangham = j.components(separatedBy: " ")[1] //신고당한사람

        reportCount[singodangham]!.insert(singoza)
    }
    print(reportCount)

    //메일발송
    for c in reportCount {
        if c.value.count >= k {
            for r in c.value {
                finMail[r]! += 1
            }
        }
    }

    //여기서 id_list순서에 맞게 출력해야함.
    print(id_list.map { finMail[$0]! })
    return id_list.map { finMail[$0]! }
}

report(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2)
//[2,1,1,0]
