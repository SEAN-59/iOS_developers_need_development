//
//  Main.swift
//  CodingTest
//
//  Created by Sean Kim on 2023/02/18.
//

import Foundation

func main(){
    print("Hello World")
    let intputValue = KeyInput().keyReadLineInt(readLine())
    if intputValue.resultType == .ERROR {
        print("Int 변환 오류입니다.")
    } else {
        print(intputValue)
    }
}

main()
