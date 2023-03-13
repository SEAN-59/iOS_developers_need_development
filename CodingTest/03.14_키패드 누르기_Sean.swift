//
//  03.14_키패드 누르기_Sean.swift
//  CodingTest
//
//  Created by Sean Kim on 2023/03/14.
//

import Foundation
// START: 04:00
// END  : 05:00
func solution(_ numbers:[Int], _ hand:String) -> String {
    var result: String = ""
    var leftHand: Int = -1
    var rightHand: Int = -1
    
    
    for i in numbers {
        let value = checkNumber(number: i)
        if value == "L" {
            leftHand = i
            result += value
        } else if value == "R" {
            rightHand = i
            result += value
        } else {
            let rightMove = moveRightHand(right: rightHand, endPoint: i)
            let leftMove = moveLeftHand(left: leftHand, endPoint: i)
            print("/////////RIGHT/////////")
            print("hand: \(rightHand)")
            print("end: \(i)")
            print("right: \(rightMove)")

            print("/////////LEFT/////////")
            print("hand: \(leftHand)")
            print("end: \(i)")
            print("left: \(leftMove)")
            
            

            if leftMove == rightMove{
                switch hand {
                case "right":
                    rightHand = i
                    result += "R"
                default:
                    leftHand = i
                    result += "L"
                }
            } else {
                if leftMove > rightMove {
                    rightHand = i
                    result += "R"
                } else {
                    leftHand = i
                    result += "L"
                }
            }
            print(result)
        }
    }
    
    
    return result
}

func checkNumber(number: Int) -> String{
    switch number{
    case 1, 4, 7:
        return "L"
    case 3, 6, 9:
        return "R"
    default:
        return "D"
    }
}

func moveRightHand(right: Int, endPoint: Int) -> Int {
    var moveCount: Int = 0;
    var distant: Int = endPoint - right
    
    let rightPosition: Bool = {
        if right == 3 || right == 6 || right == 9 || right == -1 {
            return true
        } else { return false }
    }()
    
    if distant == 0 {
        return moveCount
    } else if distant > 0 { // 상향
        for i in 0 ..< 4 where distant > 0 {
            if i == 0 && rightPosition {
                distant -= 1 // 가운데 줄로 카운트 보내기
            } else {
                distant -= 3
            }
            moveCount = i+1
        }
    } else { // 하향
        for i in 0 ..< 4 where distant < 0 {
            if i == 0 && rightPosition{
                distant += 1 // 가운데 줄로 카운트 보내기
            } else {
                distant += 3
            }
            moveCount = i+1
        }
    }
    
    return moveCount
}

func moveLeftHand(left: Int, endPoint: Int) -> Int {
    var moveCount: Int = 0;
    var distant: Int = endPoint - left
    
    let leftPosition: Bool = {
        if left == 1 || left == 4 || left == 7 || left == -1 {
            return true
        } else { return false }
    }()
    
    if distant == 0 {
        return moveCount
    } else if distant > 0 { // 상향
        for i in 0 ..< 4 where distant > 0 {
            if i == 0 && leftPosition{
                distant -= 1 // 가운데 줄로 카운트 보내기
            } else {
                distant -= 3
            }
            moveCount = i+1
        }
    } else { // 하향
        for i in 0 ..< 4 where distant < 0 {
            if i == 0 && leftPosition {
                distant += 1 // 가운데 줄로 카운트 보내기
            } else {
                distant += 3
            }
            moveCount = i+1
        }
    }
    
    return moveCount
}

/*

 [7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2]    "left"    "LRLLRRLLLRR"
 
 INPUT   : - 7 0 8 [2 8] 3 1 5 7 6 2
 LEFT    : * 7 7 8 [8 8] 8 1 5 7 7 7
 RIGHT   : # # 0 0 [2 2] 3 3 3 3 6 2
 PRINT   : - L R L [R L] R L L L R R
 WANT    : - L R L [L R] R L L L R R
 
 [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]    "right"    "LLRLLRLLRL"
 INPUT   : - 1 2 3 4 5 6 7 8 9 0
 LEFT    : * 1 2 2 4 5 5 7 8 8 0
 RIGHT   : # # # 3 3 3 6 6 6 9 9
 PRINT   : - L L R L L R L L R L


*/
