import Foundation

var rt = (r:0, t:0)
var cf = (c:0, f:0)
var jm = (j:0, m:0)
var an = (a:0, n:0)

func solution(_ survey:[String], _ choices:[Int]) -> String {
    // survey       choices
    //"RT", "TR"    1 2 3 4 5 6 7
    //"FC", "CF"
    //"MJ", "JM"
    //"NA", "AN"
    let q = survey.map {
        Survey(rawValue: $0)!
    }

    for index in 0..<survey.count {
        q[index].getType(choices[index])
    }
    
    var mbti = ""
    
    mbti += (rt.r >= rt.t) ? "R" : "T"
    mbti += (cf.c >= cf.f) ? "C" : "F"
    mbti += (jm.j >= jm.m) ? "J" : "M"
    mbti += (an.a >= an.n) ? "A" : "N"
    
    return mbti
}

enum Survey: String {
    case RT, TR, FC, CF, MJ, JM, AN, NA
    
    func getType(_ choice: Int) {
        switch self {
        case .RT:
            rt.r += getPoint(choice).0
            rt.t += getPoint(choice).1
            break;
        case .TR:
            rt.r += getPoint(choice).1
            rt.t += getPoint(choice).0
            break;
        case .CF:
            cf.c += getPoint(choice).0
            cf.f += getPoint(choice).1
            break;
        case .FC:
            cf.c += getPoint(choice).1
            cf.f += getPoint(choice).0
            break;
        case .JM:
            jm.j += getPoint(choice).0
            jm.m += getPoint(choice).1
            break;
        case .MJ:
            jm.j += getPoint(choice).1
            jm.m += getPoint(choice).0
            break;
        case .AN:
            an.a += getPoint(choice).0
            an.n += getPoint(choice).1
            break;
        case .NA:
            an.a += getPoint(choice).1
            an.n += getPoint(choice).0
            break;
        default:
            break;
        }
    }
    
    func getPoint(_ choice: Int) -> (Int, Int) {
        switch choice {
        case 1: return (3, 0)
        case 2: return (2, 0)
        case 3: return (1, 0)
        case 4: return (0, 0)
        case 5: return (0, 1)
        case 6: return (0, 2)
        case 7: return (0, 3)
        default: return (0, 0)
        }
    }
}
    
