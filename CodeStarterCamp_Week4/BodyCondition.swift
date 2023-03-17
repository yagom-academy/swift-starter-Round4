//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by 서혜진 on 2023/03/17.
//

import Swift

class BodyCondition {
    var upperBodyMuscleStrength: Int
    var lowerBodyMuscleStrength: Int
    var muscularEndurance: Int
    var degreeOfFatigue: Int {
        didSet{
            print("""
    ------------------------
    현재의 컨디션은 다음과 같습니다.
    상체근력: \(upperBodyMuscleStrength)
    하체근력: \(lowerBodyMuscleStrength)
    근지구력: \(muscularEndurance)
    피로도: \(degreeOfFatigue)
    
    """)
        }
    }
    
    init(upper: Int, lower: Int, muscular: Int, fatigue: Int) {
        self.upperBodyMuscleStrength = upper
        self.lowerBodyMuscleStrength = lower
        self.muscularEndurance = muscular
        self.degreeOfFatigue = fatigue
    }
}

