import Foundation
// 0311 13:50 ~ 14:50
func solution(_ dartResult:String) -> Int {
    // 3번의 기회
    // S: 1제곱, D: 2제곱, T: 3제곱
    // *: 두배, #: 마이너스
    // *은 첫번쨰에도 나올수 있음
    // *은 중첩이 가능함
    // *과#도 중첩이 가능함
    // S,D,T는 점수마다 하나씩존재
    // *,# 은 점수마다 둘중하나만 가능, 존재하지 않을 수 있음
    
    let dartArray = Array(dartResult)
    print("dartArray", dartArray)
    // 10을 처리 할 수 있도록 어레이 재구성
    var make10 = [String]()
    for (idx, dart) in dartArray.enumerated() {
        if dart == "1" {
            if dartArray[idx+1] == "0" {
                make10.append("10")
            } else {
                make10.append("1")
            }
        } else if dart == "0"{
            if idx == 0 {
                make10.append("0")
            } else if dartArray[idx-1] == "1" {
                continue
            } else {
                make10.append("0")
            }
        } else {
            make10.append(String(dart))
        }
    }
    print("make10", make10)
    
    // 숫자 기준으로 시행에 대한 어레이 제작
    var startIdx = 0
    var tempArray = [[String]]()
    for (idx, dart) in make10.enumerated() {
        if idx == 0 {
            continue
        }
        if let _ = Int(dart) {
            tempArray.append(Array(make10[startIdx..<idx]))
            startIdx = idx
        }
        if idx == make10.count - 1 {
            tempArray.append(Array(make10[startIdx...idx]))
            
        }
    }
    print("tempArray", tempArray)
    // 결과각 시행의 결과값을 저장할 어레이 제작
    var resultArray = Array(repeating: 0.0, count: 3)
    for i in 0..<3 {
        for j in tempArray[i]{
            if let number = Double(j) {
                resultArray[i] = number
            }
            
            switch j {
            case "S":
                resultArray[i] = pow(resultArray[i], 1)
            case "D":
                resultArray[i] = pow(resultArray[i], 2)
            case "T":
                resultArray[i] = pow(resultArray[i], 3)
            case "*":
                if i != 0 {
                    resultArray[i-1] *= 2
                }
                resultArray[i] *= 2
            case "#":
                resultArray[i] *= -1
            default:
                continue
            }
        }
    }
    print("resultArray", resultArray)
    // 어레이 덧셈
    let result = resultArray.reduce(0) { $0 + $1 }
    print("************** -> ", result)
    
    return Int(result)
}

solution("1S2D*3T") // 37 : 1^1 * 2 + 2^2 * 2 + 3^3
solution("1D2S#10S") // 9 : 1^2 + 2^1 * (-1) + 10^1
solution("1D2S0T") // 3 : 1^2 + 2^1 + 03
solution("1S*2T*3S") // 23 : 1^1 * 2 * 2 + 2^3 * 2 + 3^1
solution("1D#2S*3S") // 5 : 1^2 * (-1) * 2 + 2^1 * 2 + 3^1
solution("1T2D3D#") // -4 : 1^3 + 2^2 + 3^2 * (-1)
solution("1D2S3T*") // 59 : 1^2 + 2^1 * 2 + 3^3 * 2
solution("0D2S10T*") // 2004 : 0^2 + 2^1 * 2 + 10^3 * 2
solution("0D0S0T*") // 0 : 0^2 + 0^1 * 2 + 0^3 * 2
solution("10D10S10T*") // 0 : 0^2 + 0^1 * 2 + 0^3 * 2

