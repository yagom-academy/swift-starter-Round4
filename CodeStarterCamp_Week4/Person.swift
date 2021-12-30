//
//  Person.swift
//  CodeStarterCamp_Week4
//
//  Created by 조민호 on 2021/12/29.
//

import Foundation

final class Person {
    let name: String
    let bodyCondition: BodyCondition
    
    init(name: String, bodyCondition: BodyCondition) {
        self.name = name
        self.bodyCondition = bodyCondition
    }
    
    func exercise(for set: Int, routine: Routine) throws {
        for setOrder in 1 ... set {
            do {
                try routine.start(for: setOrder)
                checkCurrentCondition(for: setOrder)
            } catch FitnessError.fatigueFull {
                fatigue()
                break
            }
        }
    }
    
    func checkCurrentCondition(for set: Int) {
        print("--------------")
        print("\(set)set 성공입니다! 현재 \(name)님의 컨디션은 다음과 같습니다.")
        print("상체근력: \(self.bodyCondition.upperBodyStrength)")
        print("하체근력: \(self.bodyCondition.lowerBodyStrength)")
        print("근지구력: \(self.bodyCondition.muscularEndurance)")
        print("피로도: \(self.bodyCondition.fatigue)")
    }
    
    func fatigue() {
        print("--------------")
        print("\(name)님의 피로도가 \(self.bodyCondition.fatigue)입니다. 회원님이 도망갔습니다.")
    }
}
