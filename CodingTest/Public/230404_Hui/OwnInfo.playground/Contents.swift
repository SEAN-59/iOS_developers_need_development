import Foundation

//1차 : 1번빼고 모두 FAIL남.
//반례 : 앞에서 이미 수가 크다면 그대로 멈춰야함.. 오늘이 2020이고 만료일이 2021이면 바로 멈춰야한다는뜻.

//2차 : 15:런타임에러, 17:FAIL남.
//반례 : month가 12의배수면 모두 년도로 들어가고 month가 0이되므로 해당 사항을 고려해서 작성해야함.
//23.03.28
func own(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    var result = [Int]()
    var tymd = today.components(separatedBy: ".")
    
    var ymd = [String]()
    var year = 0
    var month = 0
    var date = 0
        
    for i in privacies.indices {
        var alpa = privacies[i].components(separatedBy: " ").first!.components(separatedBy: ".")
        var beta = privacies[i].components(separatedBy: " ").last!
        print("\(alpa), \(beta)")
        
        for j in terms {
            var gamba = j.components(separatedBy: " ").last!

            if beta == j.components(separatedBy: " ").first! {
                //gamba를 alpa[1]에 더함
                //더할때 일이 -1일 되어야하며, 만약 일이 1일이라면 전달 28일로 변경됨.
                if Int(alpa[2])! != 1 {
                    year = Int(alpa[0])!
                    month = Int(alpa[1])! + Int(gamba)!
                    date = Int(alpa[2])! - 1
                } else {
                    year = Int(alpa[0])!
                    month = Int(alpa[1])! + Int(gamba)! - 1
                    date = 28
                }
                print("\(year).\(month).\(date)")
                
                //month가 12의배수면 모두 년도로 들어가고 month가 0이되므로
                //month가 24라면 1년만올리고 12월은 남겨야함.
                if month%12 == 0 {
                    year += month/12 - 1
                    month = 12
                } else if month%12 != 0 {
                    year += month/12
                    month = month%12
                }
            }
        }
        ymd.insert("\(year).\(month).\(date)", at: i)
    }
    
    //대조해서 파기해야 할 개인정보 인덱스 번호담기
    for n in ymd.indices {
        var cutYmd = ymd[n].components(separatedBy: " ").first!.components(separatedBy: ".")
        print("\(n), End : \(cutYmd), Today : \(tymd)")
        print("\(Int(tymd[1])!) \(Int(cutYmd[1])!)")
        
        //ymd의 날짜가 today보다 작으면 파기 ( year -> month -> date 순으로 크기비교. 앞에 결론이 나면 그냥 끝냄 )
        //str형의 01 -> 1으로 변경해야함.
        if Int(cutYmd[0])! < Int(tymd[0])! { //year
            result.append(n+1)
        } else if Int(cutYmd[0])! == Int(tymd[0])! {
            if Int(cutYmd[1])! < Int(tymd[1])! { //month
                result.append(n+1)
            } else if Int(cutYmd[1])! == Int(tymd[1])! {
                if Int(cutYmd[2])! < Int(tymd[2])! { //date
                    result.append(n+1)
                }
            }
        }
    }
    
    print(result) 
    return result
}

//own("2020.01.02", ["A 1"], ["2020.01.02 A"]) //반례1
own("2021.12.08", ["A 18"], ["2020.06.08 A"]) //반례2
//own("2022.05.19", ["A 6", "B 12", "C 3"], ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"])
//own("2020.01.01", ["Z 3", "D 5"], ["2019.01.01 D", "2019.11.15 Z", "2019.08.02 D", "2019.07.01 D", "2018.12.28 Z"])

