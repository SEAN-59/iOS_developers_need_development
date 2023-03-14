import Foundation

//키패드 누르기
func KeyPad(_ numbers:[Int], _ hand:String) -> String {
        
    var result = ""
    var lefth = [0,0] //* (왼손)
    var righth = [2,0] //# (오른손)
    
    var leftHand = 0 //2,5,8,0 case
    var rightHand = 0 //2,5,8,0 case
    
    for i in numbers {
        
        // 0을 받았을 경우 11로 변경하기
        var number = i == 0 ? 11 : i
        //print("Left : \(lefth), Right : \(righth), Distance : \(result)")
        
        switch number {
        case 1 :
            result.append("L")
            lefth = [0,3]
        case 4 :
            result.append("L")
            lefth = [0,2]
        case 7:
            result.append("L")
            lefth = [0,1]
            
        case 3 :
            result.append("R")
            righth = [2,3]
        case 6 :
            result.append("R")
            righth = [2,2]
        case 9 :
            result.append("R")
            righth = [2,1]
        
        //거리계산 : 맨해튼거리 |x1-x2|+|y1-y2|
        case 2 :
            leftHand = Int((1-lefth[0]).magnitude + (3-lefth[1]).magnitude)
            rightHand = Int((1-righth[0]).magnitude + (3-righth[1]).magnitude)
            
            if leftHand == rightHand {
                if hand == "left" {
                    result.append("L")
                    lefth = [1,3]
                } else if hand == "right" {
                    result.append("R")
                    righth = [1,3]
                }
            }

            if leftHand < rightHand {
                result.append("L")
                lefth = [1,3]
            } else if leftHand > rightHand {
                result.append("R")
                righth = [1,3]
            }
        case 5 :
            leftHand = Int((1-lefth[0]).magnitude + (2-lefth[1]).magnitude)
            rightHand = Int((1-righth[0]).magnitude + (2-righth[1]).magnitude)
            
            if leftHand == rightHand {
                if hand == "left" {
                    result.append("L")
                    lefth = [1,2]
                } else if hand == "right" {
                    result.append("R")
                    righth = [1,2]
                }
            }

            if leftHand < rightHand {
                result.append("L")
                lefth = [1,2]
            } else if leftHand > rightHand {
                result.append("R")
                righth = [1,2]
            }
        case 8 :
            leftHand = Int((1-lefth[0]).magnitude + (1-lefth[1]).magnitude)
            rightHand = Int((1-righth[0]).magnitude + (1-righth[1]).magnitude)
            
            if leftHand == rightHand {
                if hand == "left" {
                    result.append("L")
                    lefth = [1,1]
                } else if hand == "right" {
                    result.append("R")
                    righth = [1,1]
                }
            }

            if leftHand < rightHand {
                result.append("L")
                lefth = [1,1]
            } else if leftHand > rightHand {
                result.append("R")
                righth = [1,1]
            }
        case 11 :
            leftHand = Int((1-lefth[0]).magnitude + (0-lefth[1]).magnitude)
            rightHand = Int((1-righth[0]).magnitude + (0-righth[1]).magnitude)
            
            if leftHand == rightHand {
                if hand == "left" {
                    result.append("L")
                    lefth = [1,0]
                } else if hand == "right" {
                    result.append("R")
                    righth = [1,0]
                }
            }

            if leftHand < rightHand {
                result.append("L")
                lefth = [1,0]
            } else if leftHand > rightHand {
                result.append("R")
                righth = [1,0]
            }
        default:
            break
        }
    }
    
    return result
}

KeyPad([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right") //"LRLLLRLLRRL"
