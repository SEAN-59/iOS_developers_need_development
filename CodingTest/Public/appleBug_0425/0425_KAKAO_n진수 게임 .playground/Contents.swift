
// 20:00 ~ 20:18
func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    // 진법 n,
    // 미리 구할 숫자의 갯수 t,
    // 게임에 참가하는 인원 m,
    // 튜브의 순서 p
    // 튜브가 말해야 하는 숫자 t개를 공백 없이 차례대로 나타낸 문자열. 단, 10~15는 각각 대문자 A~F로 출력한다.
    
    print("진법으로 구해야할 최대 갯수", t*m)
    print("튜브의 순서", p)
    print("참가인원", m)
    
    var number = 0
    var testNumberList = [Character]()
    // 불러야할 숫자리스트 최대갯수만큼 미리생성
    while testNumberList.count <= t*m {
//        print(Array(String(number, radix: n)))
        let radixNumber = Array(String(number, radix: n))
        testNumberList.append(contentsOf: radixNumber)
        number += 1
    }
    print(testNumberList)
    
    // stride를 통해 튜브의 순서만 가져옴
    var result = ""
    for i in stride(from: p-1, to: t*m, by: m) {
        print("stride :" , i)
        result += String(testNumberList[i]).uppercased()
    }

    return result
}




//n    t    m    p    result
//solution(2, 4, 2, 1) ==    "0111"
//solution(16, 16, 2, 1) ==   "02468ACE11111111"
//solution(16, 16, 2, 2) ==   "13579BDF01234567"
//solution(16, 30, 2, 2) ==   "13579BDF0123456789ABCDEF012345"
solution(16, 16, 3, 2)

