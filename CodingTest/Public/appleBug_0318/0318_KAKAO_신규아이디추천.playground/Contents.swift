import Foundation
// 13:20 ~ 14:05
func solution(_ new_id:String) -> String {
    // id 길이는 3~15
    // id는 소문자, 숫자, -, _, . 만사용 사능
    // . 는 처음과 끝, 연속으로 사용 불가
    // 1단계 : new_id의 모든 대문자를 대응되는 소문자로 치환합니다.
    let firstStepId = new_id.lowercased()
    print(firstStepId)
    // 2단계 : new_id에서 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거합니다.
    let regex = "^[0-9a-z\\_\\.\\-]$"
    let secondStepId = firstStepId.filter {
        return String($0).range(of: regex, options: .regularExpression) != nil
    }
    print(secondStepId)
    // 3단계 : new_id에서 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표(.)로 치환합니다.
    var thirdStepId = secondStepId.replacingOccurrences(of: "..", with: ".")
    while true {
        if thirdStepId.contains("..") {
            thirdStepId = thirdStepId.replacingOccurrences(of: "..", with: ".")
        } else {
            break
        }
    }
    print(thirdStepId)
    // 4단계 : new_id에서 마침표(.)가 처음이나 끝에 위치한다면 제거합니다.
    var fourthStepId = thirdStepId
    while true {
        if fourthStepId.first == "." {
            fourthStepId.removeFirst()
        }
        if fourthStepId.last == "." {
            fourthStepId.removeLast()
        }
        if fourthStepId.first != "." && fourthStepId.last != "." {
            break
        }
    }
    print(fourthStepId)
    // 5단계 : new_id가 빈 문자열이라면, new_id에 "a"를 대입합니다.
    var fifthStepId = fourthStepId
    if fifthStepId == "" {
        fifthStepId = "a"
    }
    print(fifthStepId)
    // 6단계 : new_id의 길이가 16자 이상이면, new_id의 첫 15개의 문자를 제외한 나머지 문자들을 모두 제거합니다.
    // 만약 제거 후 마침표(.)가 new_id의 끝에 위치한다면 끝에 위치한 마침표(.) 문자를 제거합니다.
    var sixthStepId = fifthStepId
    if sixthStepId.count >= 16 {
        let endIndex = sixthStepId.index(sixthStepId.startIndex, offsetBy: 15)
        sixthStepId = String(sixthStepId[sixthStepId.startIndex..<endIndex])
        if sixthStepId.last == "." {
            sixthStepId.removeLast()
        }
    }
    print(sixthStepId)
    // 7단계 : new_id의 길이가 2자 이하라면, new_id의 마지막 문자를 new_id의 길이가 3이 될 때까지 반복해서 끝에 붙입니다.
    var lastStepId = sixthStepId
    let lastStepIdCount = lastStepId.count
    if lastStepIdCount <= 2 {
        for _ in 0 ..< (3-lastStepIdCount) {
            lastStepId += String(lastStepId.suffix(1))
        }
    }
    
    return lastStepId
}

solution("...!@BaT#*..y.abcdefghijklm") // "bat.y.abcdefghi"
solution("z-+.^.") // "z--"
solution("=.=") // "aaa"
solution("123_.def") // "123_.def"
solution("abcdefghijklmn.p") // "abcdefghijklmn"
solution("................") // "aaa"
solution("___") // "___"
solution("........abc........") // "abc"
solution("........a.b.c........") // "abc"
solution("........0.b.c........") // "abc"

