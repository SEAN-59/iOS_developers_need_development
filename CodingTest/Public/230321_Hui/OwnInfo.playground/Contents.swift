import Foundation

func own(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    var test = 0
    
    for i in privacies.indices {
        for j in terms.indices {
            
            if terms[j].first! == privacies[i].last! {
                var filterPrivacies = privacies[i].split(separator: " ").first!.split(separator: ".")
                var filterTerms = terms[j].split(separator: " ").last!
                
                print(filterPrivacies[filterPrivacies.startIndex]) //2021 2021 2022 2022
                print(filterTerms)
                //==================================( 여기까지는 의도한대로 잘 나옴 )

                //단, 더했을 때 month가 12가 넘으면 나누기12를 해서 몫을 year에 더해야함.
                var year = Int(filterPrivacies[0])!
                var month = Int(filterPrivacies[1])!
                
                print("\(year), \(month)") //2021 5 2021 7 2022 2 2022 2
                
                if Int(filterPrivacies[1])! + Int(filterTerms)! >= 12 {
                    test = (Int(filterPrivacies[1])! + Int(filterTerms)!)/12
                    year += test
                } else if Int(filterPrivacies[1])! + Int(filterTerms)! < 12 {
                    test = Int(filterPrivacies[1])! + Int(filterTerms)!
                    month += test
                }
                //계산한 날짜랑 today랑 비교했을때 계산한 날짜가 더 크면 해당 인덱스 넘버 result(결과)에 담기
            }
        }
    }
    
    return []
}

own("2022.05.19", ["A 6", "B 12", "C 3"], ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"])
