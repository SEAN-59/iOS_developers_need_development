import Foundation
// 0313 16:00 ~ 16:33
func solution(_ numbers:[Int], _ hand:String) -> String {
    // start - *, #
    /*
     1 2 3    0,0 0,1 0,2
     4 5 6 -> 1,0 1,1 1,2
     7 8 9    2,0 2,1 2,2
     * 0 #    3,0 3,1 3,2
     */
    var leftThumbLocation = (3,0)
    var rightThumbLocation = (3,2)
    
    var result = ""
    for number in numbers {
//        print("start thumb - ", leftThumbLocation, rightThumbLocation)
        var thumb = ""
        switch number {
        case 1, 4, 7:
            leftThumbLocation = (number/3,0)
            thumb = "L"
        case 3, 6, 9:
            rightThumbLocation = ((number/3 - 1),2)
            thumb = "R"
        default:
            let location = number == 0 ? (3,1) : (number/3,1)
            let left = abs(leftThumbLocation.0 - location.0) + abs(leftThumbLocation.1 - location.1)
            let right = abs(rightThumbLocation.0 - location.0) + abs(rightThumbLocation.1 - location.1)
            if left > right {
                rightThumbLocation = location
                thumb = "R"
            } else if left < right {
                leftThumbLocation = location
                thumb = "L"
            } else {
                if hand == "left" {
                    leftThumbLocation = location
                    thumb = "L"
                } else {
                    rightThumbLocation = location
                    thumb = "R"
                }
            }
        }
//        print("end thumb - \(number) ", leftThumbLocation, rightThumbLocation)
        result += thumb
    }
//    print(result)
    return result
}

solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right") // "LRLLLRLLRRL"
solution([7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2], "left") // "LRLLRRLLLRR"
solution([1, 2, 3, 4, 5, 6, 7, 8, 9, 0], "right") // "LLRLLRLLRL"


