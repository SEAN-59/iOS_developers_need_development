import Foundation

//func solution(_ files:[String]) -> [String] {
//    var head = [String]()
//    var number = [Int]()
//    var fileCut = files.sorted() //수정 필요
//
//    //head
//    for i in fileCut {
//        var demo = i.components(separatedBy: ["0","1","2","3","4","5","6","7","8","9"])
//        head.append(demo[0])
//    }
//
//    //number
//    for i in fileCut {
//        var demo = i.components(separatedBy: ["A", "B", "C", "D", "E", "F", "G", "H",
//                                              "I", "J", "K", "L", "M", "N", "O", "P",
//                                              "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
//                                              "a", "b", "c", "d", "e", "f", "g", "h",
//                                              "i", "j", "k", "l", "m", "n", "o", "p",
//                                              "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
//                                              " ", ".", "-"]).compactMap{Int($0)}
//        number.append(demo[0])
//    }
//
//    //sort
//    for i in head.indices {
//        var imsi = ""
//
//        if i > 1 {
//            if head[i-1].lowercased() == head[i].lowercased() {
//                if number[i-1] > number[i] {
//                    imsi = fileCut[i-1]
//                    fileCut[i-1] = fileCut[i]
//                    fileCut[i] = imsi
//                }
//            } else {
//                imsi = fileCut[i-1]
//                fileCut[i-1] = fileCut[i]
//                fileCut[i] = imsi
//            }
//        }
//    }
//
//    print("\(head), \(number), \(fileCut)")
//
//    return fileCut
//}
//
//solution(["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"])
//solution(["F-5 Freedom Fighter", "B-50 Superfortress", "A-10 Thunderbolt II", "F-14 Tomcat"])

func solution2(_ files:[String]) -> [String] {
    //정규식 사용시 tail 무시 가능
    var head = "[a-zA-Z-. ]*"
    var number = "[0-9]+"
    var fileCut = files
    
    var headSort = [String]()
    var numberSort = [Int]()
    
    var fileSort = [(head : String, number : Int, index : Int)]()
    var result = [String]()
    
    //head, number 분할
    for (index,value) in fileCut.enumerated() {
        guard let headCut = value.range(of: head, options: .regularExpression),
              let numberCut = value.range(of: number, options: .regularExpression) else { continue }
        
        headSort.append(String(value[headCut]))
        numberSort.append(Int(value[numberCut])!)
        
        //여기서 .lowercased()를 해야 성공 ( 안그럼 3,4,5,6,7,19,20 실패 )
        fileSort.append((head: String(value[headCut].lowercased()), number: Int(value[numberCut])!, index: index))
    }
    print(fileSort)
    
    //정렬
    fileSort.sort {
        if $0.head == $1.head {
            if $0.number == $1.number {
                return $0.index < $1.index
            }
            return $0.number < $1.number
        } else {
            return $0.head < $1.head
        }
    }
    
    //결과정리
    for answer in fileSort {
        print(answer)
        result.append(files[answer.index])
    }
    
    print(result)
    return result
}
//solution2(["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"])
//solution2(["F-5 Freedom Fighter", "B-50 Superfortress", "A-10 Thunderbolt II", "F-14 Tomcat"])
solution2(["IMG.01.GIF", "img-01.PNG", "img 01.jpeg"]) //" " -> - -> . 순서인데 0번인덱스는 항상고정..
