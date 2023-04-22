import Foundation

func tuple(_ s:String) -> [Int] {
    //이거는 프로그래머스에서 잘되네요.
    var splitString = s.replacingOccurrences(of: "{{", with: "").replacingOccurrences(of: "}}", with: "").components(separatedBy: "},{").sorted { $0.count < $1.count }
    
    //해당 Split이 Playgrounds에서는 잘되는데, 프로그래머스에서는 에러남.
    //var splitString = s.split(separator: "{{")[0].split(separator: "}}")[0].split(separator: "},{").sorted { $0.count < $1.count }
    var result = [Int]()
    
    for i in splitString {
        var testElements = i.split(separator: ",")
        
        for j in testElements {
            if !(result.contains(Int(j)!)) {
                result.append(Int(j)!)
            }
        }
    }
    
    return result
}

//tuple("{{20,111},{111}}")
tuple("{{1,2,3},{2,1},{1,2,4,3},{2}}")
