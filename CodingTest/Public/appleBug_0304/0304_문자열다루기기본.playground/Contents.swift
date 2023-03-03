
// 0303_ 11:18 ~ 11:26
import Foundation


func solution(_ s:String) -> Bool {
    let count = s.count
    let isNum = s.trimmingCharacters(in: .decimalDigits)
    if count == 4 || count == 6 {
        if isNum == "" {
            return true
        } else {
            return false
        }
    } else {
        return false
    }
}

solution("a234")
solution("1234")


