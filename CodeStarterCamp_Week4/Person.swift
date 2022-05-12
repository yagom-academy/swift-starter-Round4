//
//  Person.swift
//  CodeStarterCamp_Week4
//
//  Created by mingmac on 2022/05/10.
//

import Foundation

class Person {
    let name: String
    var bodyCondition: BodyCondition
    
    init(name: String, bodyCondition: BodyCondition) {
        self.name = name
        self.bodyCondition = bodyCondition
    }
    
    func exercise(routine: Routine, for set: Int) throws {
        let overTiredness = 100
        print("--------------------")
        print("\(routine.name)을(를) \(set)set 시작합니다.")
        for setCounter in 1...set {
            print("--------------------")
            print("\(setCounter)set 시작!")
            for exercise in routine.routineArray {
                    print("\(exercise.name)")
                    exercise.action(bodyCondition)
                    if bodyCondition.tiredness > overTiredness {
                        throw FitnessCenterError.runAwayMember
                    }
                }
            }
        }
    
    func printAfterBodyCondition() {
        print("--------------------")
        print("현재 \(name)님의 컨디션 입니다.")
        bodyCondition.printMucleStatus()
    }
}
