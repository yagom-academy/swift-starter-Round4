//
//  Person.swift
//  CodeStarterCamp_Week4
//
//  Created by LIMGAUI on 2022/01/04.
//

import Foundation

struct Person {
    let name: String
    let bodyCondition: BodyCondition
    
    func exercise(for set: Int, routines: [Routine], at fitnessCenter: FitnessCenter) throws {
        for count in 1...set {
            guard self.bodyCondition.fatigue < 100 else {
                throw FitnessCenter.Errors.fatigueIsOver
            }
            print("--------------")
            print("\(routines[1].name)을 \(count)set시작합니다.")
            routines.forEach { $0.exercises[1].action() }
            
            guard self.bodyCondition.uppperBodyStrength >= fitnessCenter.goalBodyCondition.uppperBodyStrength ||
                self.bodyCondition.lowerBodyStrength >=
                fitnessCenter.goalBodyCondition.lowerBodyStrength ||
                self.bodyCondition.muscularEndurance >=
                fitnessCenter.goalBodyCondition.muscularEndurance else {
                    throw FitnessCenter.Errors.wasNotGoalIn
            }
        }
        self.bodyCondition.checkCurrentBodyCondition()
    }
}
