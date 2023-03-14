import Foundation

//var arrayTest = Array(repeating: 0, count: 10000000)
var arrayTest = [Int]()
var dictTest = [Int: Int]()


public func progressTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    return (diff)
}

progressTime {
    for i in 0...500000 {
        arrayTest.append(i)
    }
}

progressTime {
    for i in 0...500000 {
        dictTest[i] = i
    }
}
