import Foundation

// 23:00 ~

func solution(_ m:String, _ musicinfos:[String]) -> String {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    let regex = "[A-G][#]*"
    let regex2 = "[A-G][#]"
    typealias musicData = (name: String, time: Double)
    
    var result = [musicData]()
    
    for musicinfo in musicinfos {
        let musicInfoArray = musicinfo.components(separatedBy: ",")
        let startTime = dateFormatter.date(from: musicInfoArray[0]) ?? Date()
        let endTime = dateFormatter.date(from: musicInfoArray[1]) ?? Date()
        let musicName = musicInfoArray[2]
        let changeRhythm = musicInfoArray[3]
            .replacingOccurrences(of: "C#", with: "1")
            .replacingOccurrences(of: "D#", with: "2")
            .replacingOccurrences(of: "E#", with: "3")
            .replacingOccurrences(of: "F#", with: "4")
            .replacingOccurrences(of: "G#", with: "5")
            .replacingOccurrences(of: "A#", with: "6")
        
        let changeM = m
            .replacingOccurrences(of: "C#", with: "1")
            .replacingOccurrences(of: "D#", with: "2")
            .replacingOccurrences(of: "E#", with: "3")
            .replacingOccurrences(of: "F#", with: "4")
            .replacingOccurrences(of: "G#", with: "5")
            .replacingOccurrences(of: "A#", with: "6")
        
        print(changeRhythm)
//        let musicRhythmArray = getStringArrayByRegex(s: musicInfoArray[3], regex: regex)
//
        var compareRhythmArray = ""
//        let mArray = getStringArrayByRegex(s: m, regex: regex)
//        print(mArray, musicRhythmArray)
//
////        print(endTime - startTime)
////        print(endTime.timeIntervalSince(startTime) / 60)
        let musicPlayTime = endTime.timeIntervalSince(startTime) / 60
        let times = Int(musicPlayTime / Double(changeRhythm.count))
        let alpha = Int(musicPlayTime) % changeRhythm.count
////        print(musicPlayTime, musicRhythm.count)
////        print(Int(musicPlayTime / Double(musicRhythmArray.count)))
//
        for _ in 0 ..< times {
            compareRhythmArray += changeRhythm
        }
        compareRhythmArray += changeRhythm.prefix(alpha)
        print(changeM, "vs", compareRhythmArray)
        
        print("aaaa",
            compareRhythmArray.contains(changeM)
        )
        
        if compareRhythmArray.contains(changeM) {
            // musicData(name: String, time: Int)
            result.append((name: musicName, time: musicPlayTime))
        }
//
//        print("compareRhythmArray", compareRhythmArray)
////        compareRhythmArray.contains { <#String#> in
////            <#code#>
////        }
    }
    print(result)
    if result.isEmpty {
        return "(None)"
    } else {
        let sortedResult = result.sorted(by: {
            $0.time > $1.time
        })
        return sortedResult[0].name
    }
}

func getChangeString(s: String) -> String { // CC#BCC#BCC#B
    var s = s.map{ String($0) }
    var result = [String]()
    for idx in 0 ..< (s.count) {
        if s[idx] == "#" {
            result.insert("#", at: result.count - 1)
        } else {
            result.append(s[idx])
        }
        print(result)
    }
    return result.joined()
}

func getStringArrayByRegex(s: String, regex: String) -> [String]{
    var result = [String]()
//    print(s.range(of: regex, options: .regularExpression))
//    print(s.range(of: regex, options: .regularExpression)?.upperBound)
//    print(s.range(of: regex, options: .regularExpression)?.lowerBound)
//    print(s.startIndex)
//
    var startIdx = s.startIndex
    
    while startIdx != s.endIndex  {
        let range = s[startIdx...].range(of: regex, options: .regularExpression)!
        result.append(String(s[range]))
//        print(s[range.upperBound])
        print(s[range.lowerBound])
        startIdx = range.upperBound
//        print(result)
    }
    return result
}

solution("ABCDEFG", ["12:00,12:14,HELLO,CDEFGAB", "13:00,13:05,WORLD,ABCDEF"]) // HELLO
solution("CC#BCC#BCC#BCC#B", ["03:00,03:30,FOO,CC#B", "04:00,04:08,BAR,CC#BCC#BCC#B"]) // FOO
solution("ABC", ["12:00,12:14,HELLO,C#DEFGAB", "13:00,13:05,WORLD,ABCDEF"]) // WORLD



