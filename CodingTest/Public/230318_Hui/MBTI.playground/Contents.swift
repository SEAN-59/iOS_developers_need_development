import Foundation

func mbti(_ survey:[String], _ choices:[Int]) -> String {
    let score = [1:3, 2:2, 3:1, 4:0, 5:1, 6:2, 7:3]
    print(survey[0].first!)
    print(survey[0].last!)
    
    for i in choices.indices { //choices의 길이 = survey의 길이
        if choices[i] < 4 {
            //survey[i].first!형의 점수를 choices[i]
//            if choices[i] == score.keys {
//                //해당 key의 score.value를 점수따로 모아두는 변수에 삽입
//            }
        } else if choices[i] > 4 {
            //survey[i].last!
        }
    }
    
    return ""
}

mbti(["AN", "CF", "MJ", "RT", "NA"], [5, 3, 2, 7, 5]) //"TCMA"
//choices
//1    매우 비동의 (str.startIndex형 +3점)
//2    비동의 (str.startIndex형 +2점)
//3    약간 비동의 (str.startIndex형 +1점)
//4    모르겠음 (0점)
//5    약간 동의 (str.lastIndex형 +1점)
//6    동의 (str.lastIndex형 +2점)
//7    매우 동의 (str.lastIndex형 +3점)

//survey[i]의 첫번째문자는 비동의란으로, 마지막문자는 동의란으로 점수합산됨
//점수가 다 구해지면 R형<->T형, C형<->F형, J형<->M형, A형<->N형 끼리 대조
//이때, 점수가 동일하면 사전순으로 따져서 형 출력
