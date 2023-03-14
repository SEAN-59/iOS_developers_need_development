import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var answer = ""
    var currentLeft = 10
    var currentRight = 12
    
    func leftTapped(num: Int) {
        answer += "L"
        currentLeft = num
    }

    func rightTapped(num: Int) {
        answer += "R"
        currentRight = num
    }
    
    for num in numbers {
        switch num {
        case 1, 4, 7:
            leftTapped(num: num)
        case 3, 6, 9:
            rightTapped(num: num)
        case 2, 5, 8, 0:
            let number = num == 0 ? 11 : num
            currentLeft = currentLeft == 0 ? 11 : currentLeft
            currentRight = currentRight == 0 ? 11 : currentRight
            
            let valueL = abs(number - currentLeft)
            let valueR = abs(number - currentRight)
            
            let distanceL = (valueL / 3) + (valueL % 3)
            let distanceR = (valueR / 3) + (valueR % 3)
            
            if distanceL == distanceR {
                hand == "right" ? rightTapped(num: num) : leftTapped(num: num)
            } else {
                distanceR > distanceL ? leftTapped(num: num) : rightTapped(num: num)
            }
        default:
            break
        }
    }

    return answer
}

solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right") == "LRLLLRLLRRL"
solution([7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2], "left") == "LRLLRRLLLRR"
solution([1, 2, 3, 4, 5, 6, 7, 8, 9, 0], "right") == "LLRLLRLLRL"
