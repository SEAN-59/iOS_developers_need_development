import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    var result: [Int] = []
    let todayDate = convertStringToDate(today)

    var termsDictionary: [String: Int] = [:]
    for term in terms {
        let components = term.split(separator: " ")
        termsDictionary[String(components[0])] = Int(components[1])
    }
//    print(termsDictionary)
    
    for (index, privacy) in privacies.enumerated() {
        // print(privacy)
        let components = privacy.split(separator: " ")
        let privacyDate = convertStringToDate(String(components[0]))
        let term = String(components[1])
        let num = index + 1

        if let validPeriod = termsDictionary[term] {
            let endDate = addMonths(privacyDate, validPeriod)
            if endDate <= todayDate {
                result.append(num)
            }
        }
    }

    return result.sorted()
}

func convertStringToDate(_ dateString: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy.MM.dd"
    return dateFormatter.date(from: dateString)!
}

func addMonths(_ date: Date, _ months: Int) -> Date {
    let calendar = Calendar.current
    var dateComponents = DateComponents()
    dateComponents.month = months
    return calendar.date(byAdding: dateComponents, to: date)!
}

let today = "2022.05.19"
let terms = ["A 6", "B 12", "C 3"]
let privacies = ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"]

let result = solution(today, terms, privacies)
print(result) // [1, 3]

let today2 = "2020.01.01"
let terms2 = ["Z 3", "D 5"]
let privacies2 = ["2019.01.01 D", "2019.11.15 Z", "2019.08.02 D", "2019.07.01 D", "2018.12.28 Z"]

let result2 = solution(today2, terms2, privacies2)
print(result2)
