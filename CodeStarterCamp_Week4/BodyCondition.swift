//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by 황지웅 on 2022/05/02.
//

import Foundation

struct BodyCondition {
    static func <= (lhs: BodyCondition, rhs: BodyCondition) -> Bool {
        return lhs.upperBody <= rhs.upperBody &&
               lhs.lowerBody <= rhs.lowerBody &&
               lhs.muscularEndurance <= rhs.muscularEndurance
    }
    
    private var upperBody: Int
    private var lowerBody: Int
    private var muscularEndurance: Int
    private var fatigue: Int
    
    var myFatigue: Int {
        get {
            return fatigue
        }
    }
    
    init(upperBody: Int,
         lowerBody: Int,
         muscularEndurance: Int,
         fatigue: Int) {
        self.upperBody = upperBody
        self.lowerBody = lowerBody
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    mutating func growMuscles(bodyPart: BodyPart,
                    overLimitValue: Int,
                    underLimitValue: Int) {
        let incrementValue = Int.random(in: overLimitValue...underLimitValue)
        switch bodyPart {
        case .upperBody:
            upperBody += incrementValue
        case .lowerBody:
            lowerBody += incrementValue
        case .muscularEndurance:
            muscularEndurance += incrementValue
        }
    }
    
    mutating func manageFatigue(overLimitValue: Int,
                       underLimitValue: Int,
                       restOfTraining: ExerciseState) {
        let amountOfChange = Int.random(in: overLimitValue...underLimitValue)
        switch restOfTraining {
        case .rest:
            fatigue = fatigue + amountOfChange.negative
            fatigue = fatigue.isNagative ? 0: fatigue
        case .training:
            fatigue = fatigue + amountOfChange
        }
    }
    
    func checkFatigue() -> Bool {
        return fatigue >= 100
    }
    
    func isReachedGoal(goal: BodyCondition) -> Bool {
        return goal <= self
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
