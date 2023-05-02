
// 20:22 ~ 21:30
func solution(_ msg:String) -> [Int] {
    // LZW(Lempel–Ziv–Welch) 압축
    /*
     LZW 압축은 다음 과정을 거친다.
     1. 길이가 1인 모든 단어를 포함하도록 사전을 초기화한다.
     2. 사전에서 현재 입력과 일치하는 가장 긴 문자열 w를 찾는다.
     3. w에 해당하는 사전의 색인 번호를 출력하고, 입력에서 w를 제거한다.
     4. 입력에서 처리되지 않은 다음 글자가 남아있다면(c), w+c에 해당하는 단어를 사전에 등록한다.
     5. 단계 2로 돌아간다.
     */
//    색인 번호    1    2    3    ...    24    25    26
//    단어    A    B    C    ...    X    Y    Z
    // 1.
    var initDict = "0ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { String($0) }
    var result = [Int]()
    // 두개를 뽑아와서 확인 -> 사전에 있으면 3개 확인 -> 반복
    //                 -> 사전에 없으면 사전에 등록 -> 이전값까지 삭제
    
    // prefix사용
    var msg = msg
    // 2 ~ 5
    // msg가 비어있을때 까지 반복
    while !msg.isEmpty {
        print(msg)
        // 횟수 체크 (나중에 앞에부터 몇개 지울지 횟수)
        var count = 0
        for i in 1 ... msg.count {
            // prefix를 통해 판별할 문자 가져옴
            let prefixMsg = String(msg.prefix(i))
            print("prefix",prefixMsg)
            // 판별할 문자가 사전에 있을 경우 (다음문자까지 포함한 것으로 다시 판별해야함)
            if initDict.contains(prefixMsg) {
                // 횟수 1증가
                count += 1
                // 마지막 판별의 경우에도 사전에 문자가 있는 경우가 존재
                // 해당 케이스에 대응하기 위해 판별할 문자와 msg가 같을경우 사전 인덱스를 결과값에 추가
                if prefixMsg == msg {
                    print("if if", initDict.firstIndex(of: prefixMsg) ?? 0)
                    result.append(initDict.firstIndex(of: prefixMsg) ?? 0)
                }
                print("if")
            } else { // 판별할 문자가 사전에 없을 경우
                
                // 판별할 문자를 사전에 추가
                initDict.append(prefixMsg)
                // 판별한 문자의 직전 문자의 사전 인덱스를 결과값에 추가
                print("else", initDict.firstIndex(of: String(msg.prefix(i-1))) ?? 0)
                result.append(initDict.firstIndex(of: String(msg.prefix(i-1))) ?? 0)
                // 사전에 추가했기 때문에 더 판별하지 않아도 되서 반복문 종료
                break
            }
        }
        // 사전에 있는 횟수만큼 앞에서 부터 삭제
        for _ in 0 ..< count {
            msg.removeFirst()
        }
        print("====")
    }
    return result
}

solution("KAKAO") ==  [11, 1, 27, 15]
//solution("TOBEORNOTTOBEORTOBEORNOT") ==  [20, 15, 2, 5, 15, 18, 14, 15, 20, 27, 29, 31, 36, 30, 32, 34]
//solution("ABABABABABABABAB")  ==  [1, 2, 27, 29, 28, 31, 30]

