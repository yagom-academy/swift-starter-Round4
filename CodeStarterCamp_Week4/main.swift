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

func limitsRangeLevelUp(min: Int, max: Int) -> Int {
    return Int.random(in: min...max)
}

func limitsRangeLevelDown(min: Int, max: Int) -> Int {
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

let pushup = Exercise(name: "푸쉬업") {
    var bodyCondtion = BodyCondition()
    bodyCondtion.upperBodyStrength = limitsRangeLevelUp(min: 20, max: 30)
    bodyCondtion.lowerBodyStrength = limitsRangeLevelUp(min: 0, max: 0)
    bodyCondtion.muscularEndurance = limitsRangeLevelUp(min: 10, max: 20)
    bodyCondtion.fatigueLevel = limitsRangeLevelUp(min: 10, max: 20)
    return bodyCondtion
}
let squat = Exercise(name: "스쿼트") {
    var bodyCondtion = BodyCondition()
    bodyCondtion.upperBodyStrength = limitsRangeLevelUp(min: 0, max: 0)
    bodyCondtion.lowerBodyStrength = limitsRangeLevelUp(min: 20, max: 30)
    bodyCondtion.muscularEndurance = limitsRangeLevelUp(min: 0, max: 0)
    bodyCondtion.fatigueLevel = limitsRangeLevelUp(min: 10, max: 20)
    return bodyCondtion
}

let sitUp = Exercise(name: "윗몸일으키기") {
    var bodyCondtion = BodyCondition()
    bodyCondtion.upperBodyStrength = limitsRangeLevelUp(min: 10, max: 20)
    bodyCondtion.lowerBodyStrength = limitsRangeLevelUp(min: 0, max: 0)
    bodyCondtion.muscularEndurance = limitsRangeLevelUp(min: 0, max: 0)
    bodyCondtion.fatigueLevel = limitsRangeLevelUp(min: 10, max: 20)
    return bodyCondtion
}
let running = Exercise(name: "오래달리기") {
    var bodyCondtion = BodyCondition()
    bodyCondtion.upperBodyStrength = limitsRangeLevelUp(min: 5, max: 10)
    bodyCondtion.lowerBodyStrength = limitsRangeLevelUp(min: 5, max: 10)
    bodyCondtion.muscularEndurance = limitsRangeLevelUp(min: 20, max: 30)
    bodyCondtion.fatigueLevel = limitsRangeLevelUp(min: 20, max: 30)
    return bodyCondtion
}
let buffyTest = Exercise(name: "버피테스트") {
    var bodyCondtion = BodyCondition()
    bodyCondtion.upperBodyStrength = limitsRangeLevelUp(min: 0, max: 0)
    bodyCondtion.lowerBodyStrength = limitsRangeLevelUp(min: 20, max: 30)
    bodyCondtion.muscularEndurance = limitsRangeLevelUp(min: 0, max: 0)
    bodyCondtion.fatigueLevel = limitsRangeLevelUp(min: 10, max: 20)
    return bodyCondtion
}
let relaxtion = Exercise(name: "동적휴식") {
    var bodyCondtion = BodyCondition()
    bodyCondtion.fatigueLevel = limitsRangeLevelDown(min: 5, max: 10)
    return bodyCondtion
}

var beam2 = BodyCondition()
var hellRoutine = Routine(name: "hellRoutine", order: [pushup, squat, relaxtion, relaxtion, squat])
beam2 = hellRoutine.playRoutine()
