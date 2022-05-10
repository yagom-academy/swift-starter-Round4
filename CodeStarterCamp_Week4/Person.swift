//
//  Person.swift
//  CodeStarterCamp_Week4
//
//  Created by Seong A Oh on 2022/05/10.
//

import Foundation

class Person {
    var name: String
    var bodyCondition: BodyCondition
    
    init(name: String, bodyCondition: BodyCondition) {
        self.name = name
        self.bodyCondition = bodyCondition
    }
    
    func exercise(for set: Int, routine: Routine) {
        var currentNumber = 1
        while currentNumber <= set {
            if self.bodyCondition.fatigue >= 100 {
                print("\(self.name)님의 피로도가 \(self.bodyCondition.fatigue)입니다. 회원님이 도망갔습니다.")
                break
            }
            print("--------------")
            print("\(routine.name)을 \(currentNumber)set시작합니다.")
            bodyCondition.exercise(routine: routine)
            currentNumber += 1
        }
    }
}
