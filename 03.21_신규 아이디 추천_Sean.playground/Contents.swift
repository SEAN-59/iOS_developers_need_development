
import Foundation

/*
카카오 아이디 규칙
 1. 아이디의 길이는 3~15
 2. 아이디는 알파벳 소문자, 숫자, - , _ , . 만 사용 가능
 3. . 는 처음과 끝 그리고 연속해서 사용 불가

아이디 추천 (new_id 는 입력한 아이디)
 1. 모든 대문자를 대응되는 소문자로 치환
 2. 알파벳 소문자, 숫자, - , _ , . 을 제외한 모든 문자 제거
 3. . 가 2번 연속이면 하나 제거
 4. . 가 처음이나 끝에 위치하면 제거
 5. 빈 문자열이라면 a 대입
 6. 16자 이상이면 15개 제외 모두 제거
    6-1. 만일 제거 후 끝이 . 이면 . 도 제거
 7. 길이가 2자 이하라면 마지막 문자를 3이 될때까지 반복
*/

func solution(_ new_id:String) -> String {
    var result: String = ""
    result = lengthCheck(new_id)
    
    return result
}

func lengthCheck(_ new_id: String) -> String {
    var result: String = ""
    let count: Int = new_id.count
    
    switch count{
    case 0:
        result = zeroLength(new_id)
    case 1...2:
        result = lengthSmallError(new_id)
    case 16...:
        print("goo")
    default:
        break
    }

    return result
}

//func zeroLength(_ new_id: String) -> String {
//    var result: String = ""
//    return result
//}

func zeroLength(_ new_id: String) -> String {
    /// 규칙 1 위배
    /// 추천 5 사용, 추천 7 사용
    var result: String = "aaa"
    return result
}

func lengthSmallError(_ new_id: String) -> String {
    var result: String = ""
    var idArray: [Character] = []// Array(new_id.chara
    for s in new_id {
        idArray.append(s)
    }
    print(idArray[0])
    var changeArray: [String] = []
    print(idArray)
    
    for c in idArray{
        if c.isUpper {
            changeArray.append(c.lowercased())
        }
        print(c.isNumeric)
    }
    print(changeArray)
    
    return result
}

extension Character {
    var isLower: Bool {
        for c in utf8 where (65...90) ~= c { return false }
        return true
    }
    var isUpper: Bool {
        for c in utf8 where (97...122) ~= c { return false }
        return true
    }
    var isNumeric: Bool {
        for c in utf8 where !((48...57) ~= c) { return false }
        return true
    }
}


print(solution(""))
print(solution("s"))
print(solution("AR"))
print(solution("-R"))
print(solution("2a"))
print(solution("...!@BaT#*..y.abcdefghijklm"))
print(solution("z-+.^."))
print(solution("=.="))
