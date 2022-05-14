//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by 정선아 on 2022/05/08.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    init() {
        upperBodyStrength = 0
        lowerBodyStrength = 0
        muscularEndurance = 0
        fatigue = 0
    }
    
    func exercise(routine: Routine) {
        print("\(routine.routineName)을 시작합니다.")
        print("--------------")
        for exercise in routine.exercises {
            print(exercise.name)
            exercise.action(self)
        }
        checkYourCondition()
    }
    
    func checkYourCondition() {
        print("🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBodyStrength)")
        print("하체근력: \(lowerBodyStrength)")
        print("근지구력: \(muscularEndurance)")
        print("피로도: \(fatigue)")
        print("🛣🛣🛣🛣🛣🛣🛣🛣🛣🛣🛣🛣🛣🛣")
    }
}
