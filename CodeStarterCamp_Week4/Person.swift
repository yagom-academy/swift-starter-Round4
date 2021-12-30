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
    
    func exercise(for set: Int, routine: Routine) {
        for setOrder in 1 ... set {
            routine.start(for: setOrder)
        }
        
        checkCurrentCondition()
    }
    
    func checkCurrentCondition() {
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(self.bodyCondition.upperBodyStrength)")
        print("하체근력: \(self.bodyCondition.lowerBodyStrength)")
        print("근지구력: \(self.bodyCondition.muscularEndurance)")
        print("피로도: \(self.bodyCondition.fatigue)")
    }
}
