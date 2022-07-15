//
//  step2.swift
//  CodeStarterCamp_Week4
//
//  Created by smfc on 15/7/2022.
//
import Foundation

enum InputRange {
    case small
    case medium
    case large
}

struct BodyCondition {
    var upperBodyMuscleStrength: Int = 0
    var lowerBodyMuscleStrength: Int = 0
    var muscularEndurance: Int = 0
    var bodyFatigue: Int = 0
    
    mutating func increaseUpperBodyMuscleStrength(_ inputRange: InputRange) {
        let inputValue = increaseMuscleStrength(inputRange: inputRange)
        self.upperBodyMuscleStrength += inputValue
    }
    
    mutating func increaseLowerBodyMuscleStrength(_ inputRange: InputRange) {
        let inputValue = increaseMuscleStrength(inputRange: inputRange)
        self.lowerBodyMuscleStrength += inputValue
    }
    
    mutating func increaseMuscularEndurance(_ inputRange: InputRange) {
        let inputValue = increaseMuscleStrength(inputRange: inputRange)
        self.muscularEndurance += inputValue
    }
    
    mutating func increaseBodyFatigue(_ inputRange: InputRange) {
        let inputValue = increaseMuscleStrength(inputRange: inputRange)
        self.bodyFatigue += inputValue
    }
    
    mutating func decreaseBodyFatigue(_ inputRange: InputRange) {
        let inputValue = increaseMuscleStrength(inputRange: inputRange)
        self.bodyFatigue -= inputValue
    }
    
    func increaseMuscleStrength(inputRange: InputRange) -> Int {
        switch inputRange {
        case .small:
            return Int.random(in: 5...10)
        case .medium:
            return Int.random(in: 10...20)
        case .large:
            return Int.random(in: 20...30)
        }
    }
    
    func printCondition() {
        print("""
        --------------
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(upperBodyMuscleStrength)
        하체근력: \(lowerBodyMuscleStrength)
        근지구력: \(muscularEndurance)
        피로도: \(bodyFatigue)
        --------------
        """)
    }
}

var conditionOfJae: BodyCondition = BodyCondition()
var conditionOfYagom: BodyCondition = BodyCondition()


