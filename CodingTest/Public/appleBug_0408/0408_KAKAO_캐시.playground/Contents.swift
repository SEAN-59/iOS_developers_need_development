import Foundation

// 14:50 ~ 15:28

//캐시 크기(cacheSize)와 도시이름 배열(cities)을 입력받는다.
//cacheSize는 정수이며, 범위는 0 ≦ cacheSize ≦ 30 이다.
//cities는 도시 이름으로 이뤄진 문자열 배열로, 최대 도시 수는 100,000개이다.
//각 도시 이름은 공백, 숫자, 특수문자 등이 없는 영문자로 구성되며, 대소문자 구분을 하지 않는다. 도시 이름은 최대 20자로 이루어져 있다.

// 입력된 도시이름 배열을 순서대로 처리할 때, "총 실행시간"을 출력한다.

//캐시 교체 알고리즘은 LRU(Least Recently Used)를 사용한다.
//cache hit일 경우 실행시간은 1이다.
//cache miss일 경우 실행시간은 5이다.

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    var cacheList: [String] = []
    var result = 0
    
    for city in cities {
        let lowerCity = city.lowercased()
        
        if cacheList.contains(where: { $0 == lowerCity }) {
            cacheList.removeAll(where: { $0 == lowerCity })
            result += 1
        } else {
            result += 5
        }
        
        cacheList.append(lowerCity)

        if cacheList.count > cacheSize {
            cacheList.removeFirst()
        }
        print(cacheList, city)
    }
    return result
}


solution(3, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]) // 50
solution(3, ["Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul"]) // 21
solution(2, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]) // 60
solution(5, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]) // 52
solution(2, ["Jeju", "Pangyo", "NewYork", "newyork"]) // 16
solution(0, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA"]) // 25
solution(2, ["Jeju", "Jeju", "Jeju", "Jeju", "Jeju"]) // 9
solution(2, ["a", "b", "a", "b", "a"]) // 13
solution(1, ["a", "b", "a", "b", "a"]) // 25
solution(5, ["leo", "leo", "leo"])
