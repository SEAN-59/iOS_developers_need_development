import Foundation

// 18:02 ~ 18:28
func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    // 1~n번으로 분류되는 개인정보 n개
    // terms : 1~20 개
    // privacies : 1~100개 개인정보
    
    // 약관 기간 딕셔너리화
    var result = [Int]()
    var termDict: [String: Int] = [:]
    for term in terms {
        let type = term.components(separatedBy: " ")[0]
        let period = Int(term.components(separatedBy: " ")[1])
        termDict[type] = period
    }
    print(termDict)
    
    // DateType으로 변환하기 위해 Formatter 정의
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy.MM.dd"
    print(dateFormatter.date(from: today)!)
    
    // 오늘날짜 Formatter를 통한 Date로 형변환
    let todayDate = dateFormatter.date(from: today) ?? Date()
    
    // 개인정보를 하나씩 꺼내 오늘 날짜와 비교
    for (idx, privacy) in privacies.enumerated() {
        let dateString = privacy.components(separatedBy: " ")[0]
        let date = dateFormatter.date(from: dateString) ?? Date()
        let type = privacy.components(separatedBy: " ")[1]
        
        // 딕셔너리화 된 약관 기간에서 기간을 가져오고, 비교를 위해 기간을 추가한 date 생성
        let checkDate = Calendar.current.date(byAdding: .month, value: termDict[type] ?? 0, to: date) ?? Date()
        
        // 오늘의 날짜와 체크해야할 날짜를 크기 비교
        print(todayDate, ">=", checkDate, todayDate >= checkDate)
        if todayDate >= checkDate {
            result.append(idx+1)
        }
        
    }
    
    return result
}

solution("2022.05.19", ["A 6", "B 12", "C 3"], ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"]) // [1,3]
solution("2020.01.01", ["Z 3", "D 5"], ["2019.01.01 D", "2019.11.15 Z", "2019.08.02 D", "2019.07.01 D", "2018.12.28 Z"]) // [1, 4, 5]


