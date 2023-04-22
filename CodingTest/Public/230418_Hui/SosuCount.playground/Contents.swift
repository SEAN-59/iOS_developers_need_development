import Foundation

//11,12,14,15,16 Fail (n제곱수 생각못함)
func radixFunc(_ n:Int, _ k:Int) -> Int {
    //map 강제언래핑 에러 => 어짜피 1버리니까 공백이면 1으로 변경
    var radixx = String(n, radix : k).components(separatedBy: "0").map{Int($0) ?? 1}.filter{$0>1}
    var count = 0
    print(radixx)
    
    //2<=p<=루트n인 범위에 있는 모든 소수 p로 n을 나누어 보아, 나누어 떨어지지 않으면 소수
    for value in radixx {
        var mid = 0
        
        if value >= 4 { //value가 2,3이면 sqrt때 에러나서 따로 나눔.
            for i in 2...Int(sqrt(Double(value))) {
                if value%i != 0 {
                    mid += 1
                } else { //하나라도 나누어 떨어지면 합성수니까 바로 0처리하고 끝냄
                    mid = 0
                    break
                }
            }
        } else { //2,3은 무조건 소수니까 바로 count
            count += 1
        }
        
        if mid != 0 {
            count += 1
        }
    }
    
    print(count)
    return count
}

//radixFunc(110011, 10) //["11", "", "11"] 공백
radixFunc(121, 10) //반례 : 1,19,361이라 합성수임.
