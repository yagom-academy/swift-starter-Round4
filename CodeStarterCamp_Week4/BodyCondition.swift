//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by 홍승주 on 2022/05/05.
//

import Foundation

class BodyCondition {
    var upperBodyMuscleStrength: Int // 상체근력
    var lowerBodyMuscleStrength: Int // 하체근력
    var muscleEndurance: Int // 근지구력
    var fatigue: Int // 피로도
    
    init(upperBodyMuscleStrength: Int, lowerBodyMuscleStrength: Int, muscleEndurance: Int, fatigue: Int) {
        self.upperBodyMuscleStrength = upperBodyMuscleStrength
        self.lowerBodyMuscleStrength = lowerBodyMuscleStrength
        self.muscleEndurance = muscleEndurance
        self.fatigue = fatigue
    }
    func checkBodyCondition() {
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBodyMuscleStrength)")
        print("하체근력: \(lowerBodyMuscleStrength)")
        print("근지구력: \(muscleEndurance)")
        print("피로도: \(fatigue)")
    }
}
