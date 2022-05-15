//
//  Person.swift
//  CodeStarterCamp_Week4
//
//  Created by 정선아 on 2022/05/10.
//

import Foundation

struct Person {
    var name: String
    var bodyCondition: BodyCondition
    
    func doExercise(for set: Int, routine: Routine) {
        for round in 1...set {
                guard bodyCondition.fatigue < 100 else {
                    print("\(name)님의 피로도가 \(bodyCondition.fatigue)입니다. 회원님이 도망갔습니다.")
                    break
                }
            print("--------------")
            print("\(routine.routineName)을 \(round)set시작합니다.")
            bodyCondition.exercise(routine: routine)
        }
    }
}
