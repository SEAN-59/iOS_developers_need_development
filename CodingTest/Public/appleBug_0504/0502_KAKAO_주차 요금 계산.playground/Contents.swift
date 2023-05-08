import Foundation

// 19:50 - 20:40
func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    // fees - 요금표 [기본시간, 기본요금, 단위시간, 단위요금]
    // records - 주차 입출차 내역, 나간기록이 없으면 23:59출차 간주
    
    
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    
    var carTimes: [String: Int] = [:]
    var carIn: [String: Date] = [:]
    
    for record in records {
        let time = formatter.date(from: record.components(separatedBy: " ")[0])
        let carnumber = record.components(separatedBy: " ")[1]
        let inOut = record.components(separatedBy: " ")[2]
        
        if inOut == "IN" {
            carIn[carnumber] = time
        } else {
            if carTimes[carnumber] == nil {
                carTimes[carnumber] = 0
            }
//            carTimes.updateValue(<#T##value: Int##Int#>, forKey: <#T##String#>) 사용 해보기
            var useTime = Int(time!.timeIntervalSince(carIn[carnumber]!))
            carTimes[carnumber]! += useTime/60
            carIn[carnumber] = nil
        }
    }
    // 출차처리 없는 차 처리
    for (k, v) in carIn {
        if carTimes[k] == nil {
            carTimes[k] = 0
        }
        let endTime = formatter.date(from: "23:59")
        carTimes[k]! += Int((endTime?.timeIntervalSince(v))!) / 60
    }
    
    // 주차요금 계산
    // fees - 요금표 [기본시간, 기본요금, 단위시간, 단위요금]
    let basicTime = fees[0]
    let basicFee = fees[1]
    let unitTime = fees[2]
    let unitFee = fees[3]
    
    var result = [Int]()
    let sortedCarTimes = carTimes.sorted(by: { $0.key < $1.key })
    
    for (k, v) in sortedCarTimes {
        var carFee = 0
        if v <= basicTime {
            carFee = basicFee
        } else {
            carFee += basicFee
            carFee += Int(ceil(Double(v-basicTime) / Double(unitTime)) * Double(unitFee))
        }
        result.append(carFee)
    }
//    print(result)
    
//    print(carIn)
//    print(carTimes )
    
    return result
}


solution([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"])
//solution([120, 0, 60, 591], ["16:00 3961 IN","16:00 0202 IN","18:00 3961 OUT","18:00 0202 OUT","23:58 3961 IN"])
//solution([1, 461, 1, 10], ["00:00 1234 IN"])
