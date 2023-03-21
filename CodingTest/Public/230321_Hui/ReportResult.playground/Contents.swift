import Foundation

//2 ≤ id_list의 길이 ≤ 1,000
//1 ≤ report의 길이 ≤ 200,000
//중첩for문 금지..(시간초과우려)
func report(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var result = [Int]()
    var reportCount = [String : Set<String>]() //[ 신고당한사람 : 신고자(Set으로 중복제거) ]
    var demo = [String : String]()
    var count = 0
    
    //key, value작업
    for i in report {
        var test = i.components(separatedBy: " ") //report 신고자, 신고당한사람 분류
        print(test.last!)
        var singoza = String(test[0]) //신고자
        var singodangham = String(test[1]) //신고당한사람
        
        print("신고자 : \(singoza), 신고대상 : \(singodangham)")
        
        //singodangham을 기준으로 singoza정렬 필요
        
        if test.last! == singodangham {
            reportCount.updateValue(<#T##value: Set<String>##Set<String>#>, forKey: <#T##String#>)
        }
    }
    //print(reportCount)
    
    //count작업
    for n in reportCount {
        if n.value.count >= k {
            count += k
        } else {
            count = 0
        }
    }
    
    return []
}

report(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2)
//muzi => apeach에게 신고당함
//frodo => muzi, apeach에게 신고당함
//neo => frodo, muzi에게 신고당함
//appeach => X
