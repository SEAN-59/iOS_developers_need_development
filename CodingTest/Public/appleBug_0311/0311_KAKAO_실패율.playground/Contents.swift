import Foundation

// 0311 12:11 ~ 13:28
// 5,9,22 시간초과
func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    // 실패율을 구하는 코드
    // 실패율 : 스테이지 도달햇지만 클리어못한 수 / 스테이지 도달한 수
    // N: 전체 스테이지 개수, stages: 사용자가 멈춰있는 스테이지
    // 실패율이 높은 스테이지 부터 내림차순
    // N + 1은 전체 클리어
    
    var stageFailDict = [Int: Double]()
    var stageChallengeDict = [Int: Double]()
    // 딕셔너리 초기화
    for i in 1...N+1 {
        stageFailDict[i] = 0
        stageChallengeDict[i] = 0
    }
    
    print(stageFailDict)
    print(stageChallengeDict)
    print("+++++++")
    // 실패횟수, 도전횟수 딕셔너리 제작
    for stage in stages {
        stageFailDict[stage]! += 1
        for i in 1...stage {
            stageChallengeDict[i]! += 1
        }
    }
    print(stageFailDict)
    print(stageChallengeDict)
    print("+++++++")
    
    // 딕셔너리 정렬
    let aa = stageFailDict.sorted {
        $0.key < $1.key
    }
    let bb = stageChallengeDict.sorted {
        $0.key < $1.key
    }
    print(aa)
    print(bb)
    // 딕셔너리 1개로 병합
    var result = [Int:Double]()
    for (a,b) in zip(aa, bb) {
        if a.key == N+1 {
            continue
        }
        if b.value == 0 {
            result[a.key] = 0
        } else {
            result[a.key] = a.value / b.value
        }
        
    }
    print(result)
    // 딕셔너리 정렬, 리스트로 변경
    let sortedResult = result.sorted {
        if $0.value == $1.value {
            return $0.key < $1.key
        } else {
            return $0.value > $1.value
        }
    }.map {
        return $0.key
    }
    print(sortedResult)

    print("=========")
    
    
    
    return sortedResult
}

solution(5,[2, 1, 2, 6, 2, 4, 3, 3]) //[3,4,2,1,5]
solution(4,[4,4,4,4,4]) //[4,1,2,3]
solution(3,[1,1,1,1,1]) //[4,1,2,3]

import Foundation

// 0311 12:11 ~
func solution2(_ N:Int, _ stages:[Int]) -> [Int] {
    // 실패율을 구하는 코드
    // 실패율 : 스테이지 도달햇지만 클리어못한 수 / 스테이지 도달한 수
    // N: 전체 스테이지 개수, stages: 사용자가 멈춰있는 스테이지
    // 실패율이 높은 스테이지 부터 내림차순
    // N + 1은 전체 클리어
    
    var stageFailList = [Double](repeating: 0, count: N+1)
    var stageChallengeList = [Double](repeating: 0, count: N+1)
    
    
    print(stageFailList)
    print(stageChallengeList)
    print("+++++++")
    
    for stage in stages {
        stageFailList[stage-1] += 1
        for i in 1...stage {
            stageChallengeList[i-1] += 1
        }
    }
    print(stageFailList)
    print(stageChallengeList)
    print("+++++++")

    var result = [Int:Double]()
    for (idx,(a,b)) in zip(stageFailList, stageChallengeList).enumerated() {
        if idx+1 == N+1 {
            continue
        }
        if b == 0.0 {
            result[idx+1] = 0
        } else {
            result[idx+1] = a/b
        }
    }
    print(result)

    let sortedResult = result.sorted {
        if $0.value == $1.value {
            return $0.key < $1.key
        } else {
            return $0.value > $1.value
        }
    }.map {
        return $0.key
    }
    print(sortedResult)

    print("=========")
    
    
    
    return sortedResult
}

solution2(5,[2, 1, 2, 6, 2, 4, 3, 3]) //[3,4,2,1,5]
solution2(4,[4,4,4,4,4]) //[4,1,2,3]
solution2(3,[1,1,1,1,1]) //[4,1,2,3]

