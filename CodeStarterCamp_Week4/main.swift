//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BodyCondition {
    var upperBodyStrength: Int = 0
    var lowerBodyStrength: Int = 0
    var muscularEndurance: Int = 0
    var fatigueLevel: Int = 0
}

struct Exercise {
    let name: String
    let exerciseTime: Int
    let bodyContitionLevel: BodyCondition
    let coditionLevelUpdate: (BodyCondition) -> BodyCondition
}

func rangeLevel(min: Int, max: Int) -> Int {
    return Int.random(in: min...max)
}

struct Routine {
    let name: String
    var order: Array<Exercise>
    var recordedBodyCondition: BodyCondition
    
    func playRoutine() {
        print("--------------")
        print("\(name)을 시작합니다.")
        for exercise in order {
            print(exercise.name)
        }
        
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력 : \(recordedBodyCondition.upperBodyStrength)")
        print("하체근력 : \(recordedBodyCondition.lowerBodyStrength)")
        print("근지구력 : \(recordedBodyCondition.muscularEndurance)")
        print("피로도 : \(recordedBodyCondition.fatigueLevel)")
    }
}
