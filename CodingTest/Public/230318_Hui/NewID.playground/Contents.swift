import Foundation

//아이디의 길이는 3자 이상 15자 이하여야 합니다.
//아이디는 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.) 문자만 사용할 수 있습니다.
//단, 마침표(.)는 처음과 끝에 사용할 수 없으며 또한 연속으로 사용할 수 없습니다.
//신규 유저가 입력한 아이디가 new_id 라고 한다면,
//1단계 new_id의 모든 대문자를 대응되는 소문자로 치환합니다.
//2단계 new_id에서 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거합니다.
//3단계 new_id에서 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표(.)로 치환합니다.
//4단계 new_id에서 마침표(.)가 처음이나 끝에 위치한다면 제거합니다.
//5단계 new_id가 빈 문자열이라면, new_id에 "a"를 대입합니다.
//6단계 new_id의 길이가 16자 이상이면, new_id의 첫 15개의 문자를 제외한 나머지 문자들을 모두 제거합니다.
//     만약 제거 후 마침표(.)가 new_id의 끝에 위치한다면 끝에 위치한 마침표(.) 문자를 제거합니다.
//7단계 new_id의 길이가 2자 이하라면, new_id의 마지막 문자를 new_id의 길이가 3이 될 때까지 반복해서 끝에 붙입니다.

func NewID(_ new_id:String) -> String {
    
    var own = new_id
    
    //1단계
    own = own.lowercased()

    //2단계
    own = own.filter{ $0.isLetter || $0.isNumber || $0 == "-" || $0 == "_" || $0 == "."}
    
    //3단계
    while own.contains("..") {
        own = own.replacingOccurrences(of: "..", with: ".")
    }
    
    //4단계
    if own.hasPrefix(".") { //접두사(앞)
        own.removeFirst()
    }
    
    if own.hasSuffix(".") { //접미사(뒤)
        own.removeLast()
    }
    
    //5단계
    if own.isEmpty {
        own = "a"
    }
  
    //6단계 = ?
    if own.count >= 16 {
        let ranges = own.index(own.startIndex, offsetBy: 15)..<own.endIndex
        own.removeSubrange(ranges)
        
        if own.hasSuffix(".") {
            own.removeLast()
        }
    }
    
    //7단계
    if own.count <= 2 {
        while own.count != 3 {
            own += String(own.last!)
        }
    }
    
    return own
}

NewID("...!@BaT#*..y.abcdefghijklm")
