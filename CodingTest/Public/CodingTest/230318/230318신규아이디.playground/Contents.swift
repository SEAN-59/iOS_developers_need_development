import Foundation

func solution(_ new_id:String) -> String {
    //제한
    //1. 3~15글자 사이
    //2. 알파벳 소문자, 숫자, -, _, .만 사용가능
    //3. 2.의 .은 처음과 끝, 연속으로 사용할 수 x

    //step1 : 대문자 -> 소문자
    let step1 = new_id.lowercased()
    
    //step2 : 제한2 이외의 문자를 제거
    var step2 = step1.replacingOccurrences(of: "[^0-9a-z._-]", with: "", options: .regularExpression)
    
    //step3 : .. -> .
    while step2.contains("..") {
        step2 = step2.replacingOccurrences(of: "..", with: ".")
    }
    
    //step4 : .이 처음과 끝이면 제거.
    let step4 = step2.trimmingCharacters(in: ["."])
    
    //step5 : " " -> "a"
    var step5 = step4.replacingOccurrences(of: " ", with: "a")
    
    //step6 : 16자이상이면 15개문자를 제외한 나머지 제거. -> step4체크
    if step5.count >= 16 {
        step5 = step5.substring(from: 0, to: 14).trimmingCharacters(in: ["."])
    }
    //step7 : 2자이하면 마지막 문자를 길이가 3이 될때까지 반복해서 끝에 붙임.
    else if step5.count < 3 {
        var lastChar = step5.lastString
        if step5.count == 0 {
            lastChar = "a"
        }
        step5 = step5 + String(repeating: lastChar, count: 3 - step5.count)
    }
       
    return step5
}

extension String {
    func substring(from: Int, to: Int) -> String {
        guard from < count, to >= 0, to - from >= 0 else {
            return ""
        }
        
        let startIndex = index(self.startIndex, offsetBy: from)
        let endIndex = index(self.startIndex, offsetBy: to + 1)
        
        return String(self[startIndex ..< endIndex])
    }
    
    var lastString: String {
        get {
            if self.isEmpty { return self }
            
            let lastIndex = self.index(before: self.endIndex)
            return String(self[lastIndex])
        }
    }
}
