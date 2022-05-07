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

func rangeLevelUp(min: Int, max: Int) -> Int {
    return Int.random(in: min...max)
}

func rangeLevelDown(min: Int, max: Int) -> Int {
    return -Int.random(in: min...max)
}

struct Exercise {
    let name: String
    let upperLevel: () -> BodyCondition
}

struct Routine {
    let name: String
    var order: Array<Exercise>
    
    func playRoutine() -> BodyCondition {
        var tempBodyCondition = BodyCondition()
        print("--------------")
        print("\(name)을 시작합니다.")
        
        for exercise in order {
            print(exercise.name)
            let condition = exercise.upperLevel()
            tempBodyCondition.upperBodyStrength += condition.upperBodyStrength
            tempBodyCondition.lowerBodyStrength += condition.lowerBodyStrength
            tempBodyCondition.muscularEndurance += condition.muscularEndurance
            tempBodyCondition.fatigueLevel += condition.fatigueLevel
        }
        
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력 : \(tempBodyCondition.upperBodyStrength)")
        print("하체근력 : \(tempBodyCondition.lowerBodyStrength)")
        print("근지구력 : \(tempBodyCondition.muscularEndurance)")
        print("피로도 : \(tempBodyCondition.fatigueLevel)")
        
        return tempBodyCondition
    }
}

var beam2 = BodyCondition()
let pushup = Exercise(name: "푸쉬업") {
    var bodyCondtion = BodyCondition()
    bodyCondtion.upperBodyStrength = rangeLevelUp(min: 20, max: 30)
    bodyCondtion.lowerBodyStrength = rangeLevelUp(min: 0, max: 0)
    bodyCondtion.muscularEndurance = rangeLevelUp(min: 10, max: 20)
    bodyCondtion.fatigueLevel = rangeLevelUp(min: 10, max: 20)
    return bodyCondtion
}
let squrt = Exercise(name: "스쿼트") {
    var bodyCondtion = BodyCondition()
    bodyCondtion.upperBodyStrength = rangeLevelUp(min: 0, max: 0)
    bodyCondtion.lowerBodyStrength = rangeLevelUp(min: 20, max: 30)
    bodyCondtion.muscularEndurance = rangeLevelUp(min: 0, max: 0)
    bodyCondtion.fatigueLevel = rangeLevelUp(min: 10, max: 20)
    return bodyCondtion
}
var hellRoutine = Routine(name: "hellRoutine", order: [pushup, squrt])
beam2 = hellRoutine.playRoutine()
