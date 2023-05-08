import Foundation
// 22:00 ~ 22:38
func solution(_ files:[String]) -> [String] {
    
    let numberCheckRegex = "[0-9]+"
    let headerCheckRegex = "[a-zA-Z-. ]+"
    
//    var tempFileArray = [[String]]()
//
//    for idx in files.indices {
//        if let numberRange = files[idx].range(of: numberCheckRegex, options: .regularExpression),
//           let headerRange = files[idx].range(of: headerCheckRegex, options: .regularExpression) {
//            print(files[idx][headerRange], files[idx][numberRange])
//            tempFileArray.append([String(files[idx][headerRange]), String(files[idx][numberRange])])
//        }
//    }
    
    var files = files
    /*
    1. 파일명은 우선 HEAD 부분을 기준으로 사전 순으로 정렬한다. 이때, 문자열 비교 시 대소문자 구분을 하지 않는다. MUZI와 muzi, MuZi는 정렬 시에 같은 순서로 취급된다.
    2. 파일명의 HEAD 부분이 대소문자 차이 외에는 같을 경우, NUMBER의 숫자 순으로 정렬한다. 9 < 10 < 0011 < 012 < 13 < 014 순으로 정렬된다. 숫자 앞의 0은 무시되며, 012와 12는 정렬 시에 같은 같은 값으로 처리된다.
    3. 두 파일의 HEAD 부분과, NUMBER의 숫자도 같을 경우, 원래 입력에 주어진 순서를 유지한다. MUZI01.zip과 muzi1.png가 입력으로 들어오면, 정렬 후에도 입력 시 주어진 두 파일의 순서가 바뀌어서는 안 된다.
    */
    return files.sorted {
        guard let firstHeaderRange = $0.range(of: headerCheckRegex, options: .regularExpression),
              let secondHeaderRange = $1.range(of: headerCheckRegex, options: .regularExpression) else { return false }
        if $0[firstHeaderRange].lowercased() == $1[secondHeaderRange].lowercased() {
            guard let firstNumberRange = $0.range(of: numberCheckRegex, options: .regularExpression),
                  let secondNumberRange = $1.range(of: numberCheckRegex, options: .regularExpression) else { return false }
            // 2 & 3
            return Int($0[firstNumberRange])! < Int($1[secondNumberRange])!
        } else {
            // 1
            return $0[firstHeaderRange].lowercased() < $1[secondHeaderRange].lowercased()
        }
    }
}

solution(["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"])

solution(["F-5 Freedom Fighter", "B-50 Superfortress", "A-10 Thunderbolt II", "F-14 Tomcat"])

solution(["foo9.txt", "foo010bar020.zip", "F-15"])
