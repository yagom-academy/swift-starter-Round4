//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by 황지웅 on 2022/05/02.
//

import Foundation

struct BodyCondition {
    var upperBody: Int
    var lowerBody: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    func statusPrint() {
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBody)")
        print("하체근력: \(lowerBody)")
        print("근지구력: \(muscularEndurance)")
        print("피로도: \(fatigue)")
    }
    
}
