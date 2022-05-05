//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by 윤일성 on 2022/05/05.
//

import Foundation

struct BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscleEndurance: Int
    var tiredness = 0
    
    init() {
        upperBodyStrength = 30
        lowerBodyStrength = 30
        muscleEndurance = 10
    }
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscleEndurance: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscleEndurance = muscleEndurance
    }
    
    func informBodyCondition(){
        let informationOfBodyCondition = """
----------------------------------
현재의 컨디션은 다음과 같습니다.
상체근력 : \(upperBodyStrength)
하체근력 : \(lowerBodyStrength)
근지구력 : \(muscleEndurance)
피로도  : \(tiredness)
"""
        print(informationOfBodyCondition)
    }
}
