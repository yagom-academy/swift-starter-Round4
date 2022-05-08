//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by 황지웅 on 2022/05/02.
//

import Foundation

class BodyCondition {
    var upperBody: Int
    var lowerBody: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    init(upperBody: Int,
         lowerBody: Int,
         muscularEndurance: Int,
         fatigue: Int) {
        self.upperBody = upperBody
        self.lowerBody = lowerBody
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func printStatus() {
        let status = """
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(upperBody)
        하체근력: \(lowerBody)
        근지구력: \(muscularEndurance)
        피로도: \(fatigue)
        """
        print(status)
    }
    
}
