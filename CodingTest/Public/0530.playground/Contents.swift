import Foundation

func solution(_ places:[[String]]) -> [Int] {
    // 대기실 5개, 대기실 크기 5X5
    // 맨해튼 거리( |r1 - r2| + |c1 - c2| )가 2이하로 앉지 말기
    // 파티션으로 막혀있으면 허용
    // 응시자가 앉은 자리 p
    // 빈테이블 o
    // 파티션 x
    var result = [Int]()
    for place in places {
        var bool = 1
        for row in 0..<5 {
            // 자리마다 판별
            var prevTest = ""
            var test = place[row]
            var nextTest = ""
            if row == 0 {
                prevTest = ""
                nextTest = place[row+1]
            } else if row == 4 {
                prevTest = place[row-1]
                nextTest = ""
            } else {
                prevTest = place[row-1]
                nextTest = place[row+1]
            }
            
            for i in 0..<5 {
                if test[i] == "P" {
                    // 맨해튼 2 안에 들어오는 경우
                    if prevTest[i-1] == "P" {
                        if prevTest[i] == "X" &&
                            test[i-1] == "X" {
                            
                        } else {
                            bool = 0
                            break
                        }
                    }
                    if prevTest[i+1] == "P" {
                        if prevTest[i] == "X" &&
                            test[i+1] == "X" {

                        } else {
                            bool = 0
                            break
                        }
                    }
                    if nextTest[i-1] == "P" {
                        if nextTest[i] == "X" &&
                            test[i-1] == "X" {
                            
                        } else {
                            bool = 0
                            break
                        }
                    }
                    if nextTest[i+1] == "P" {
                        if nextTest[i] == "X" &&
                            test[i+1] == "X" {
                            
                        } else {
                            bool = 0
                            break
                        }
                    }
                    if test[i+2] == "P" {
                        if test[i+1] == "X" {
                            
                        } else {
                            bool = 0
                            break
                        }
                    }
                    
                    if test[i-2] == "P" {
                        if test[i-1] == "X" {
                            
                        } else {
                            bool = 0
                            break
                        }
                    }
                    
                    if test[i-1] == "P" ||
                        test[i+1] == "P" ||
                        prevTest[i] == "P" ||
                        nextTest[i] == "P" {
                            bool = 0
                        break
                    }
                    
                    if row < 2 {
                        let prevprevTest = ""
                        let nextnextTest = place[row+2]
                        if nextnextTest[i] == "P" {
                            if nextTest[i] == "X" {
                                
                            } else {
                                bool = 0
                                break
                            }
                        }
                        
                    } else if row > 2 {
                        let prevprevTest = place[row-2]
                        let nextnextTest = ""
                        if prevprevTest[i] == "P" {
                            if prevTest[i] == "X" {
                                
                            } else {
                                bool = 0
                                break
                            }
                        }
                    } else {
                        let prevprevTest = place[row-2]
                        let nextnextTest = place[row+2]
                        
                        if prevprevTest[i] == "P" {
                            if prevTest[i] == "X" {
                                
                            } else {
                                bool = 0
                                break
                            }
                        }
                        if nextnextTest[i] == "P" {
                            if nextTest[i] == "X" {
                                
                            } else {
                                bool = 0
                                break
                            }
                        }
                        
                    }
                }
            }
        }
        result.append(bool)
    }
    return result
}

extension String {
    subscript(idx: Int) -> String? {
        guard (0..<count).contains(idx) else {
            return nil
        }
        let target = index(startIndex, offsetBy: idx)
        return String(self[target])
    }
}


solution([["POOOP",
           "OXXOX",
           "OPXPX",
           "OOXOX",
           "POXXP"],
          ["POOPX",
           "OXPXP",
           "PXXXO",
           "OXXXO",
           "OOOPP"],
          ["PXOPX",
           "OXOXP",
           "OXPOX",
           "OXXOP",
           "PXPOX"],
          ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"],
          ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]])

solution([["POPOP",
           "OXXOX",
           "OPXPX",
           "OOXOX",
           "POXXP"],
          ["POOPX",
           "OXPXP",
           "PXXXO",
           "OXXXO",
           "OOOPP"],
          ["PXOPX",
           "OXOXP",
           "OXPOX",
           "OXXOP",
           "PXPOX"],
          ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"],
          ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]])
// [1,0,1,1,1]

var test = [1,2,3,4,5,6,7]
test.prefix(3)
test.suffix(3)
