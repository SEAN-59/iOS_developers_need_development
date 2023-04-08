import Foundation

//LRU Algorithm
func cache(_ cacheSize:Int, _ cities:[String]) -> Int {
    var lowerCities = [String]()
    var lru = [String]()
    var runTime = 0 //result
    
    //구별하기 쉽게 소문자로
    for i in cities.indices {
        lowerCities.append(cities[i])
        lowerCities[i] = lowerCities[i].lowercased()
    }
    
    for i in lowerCities.indices {
        //cacheSize가 0이면 lowerCities * miss
        if cacheSize == 0 {
            runTime += 5*lowerCities.count
            break
        }
        
        //현재 lru의 갯수가 cacheSize를 초과하는지 확인
        if lru.count >= cacheSize {
            //lru안에 지금 넣으려는 값이 이미 있는지 확인
            if lru.contains(lowerCities[i]) {
                runTime += 1
                lru.remove(at: lru.firstIndex(of: lowerCities[i])!)
                lru.insert(lowerCities[i], at: 0)
            } else {
                runTime += 5
                lru.popLast()
                lru.insert(lowerCities[i], at: 0)
            }
        } else {
            //lru안에 지금 넣으려는 값이 이미 있는지 확인
            if lru.contains(lowerCities[i]) {
                runTime += 1
                lru.remove(at: lru.firstIndex(of: lowerCities[i])!)
                lru.insert(lowerCities[i], at: 0)
            } else {
                runTime += 5
                lru.insert(lowerCities[i], at: 0)
            }
        }
    }
    return runTime
}

//cache(3, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]) //50
//cache(3, ["Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul"]) //21
cache(2, ["Jeju", "Pangyo", "NewYork", "newyork"]) //16
//cache(0, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA"]) //25
