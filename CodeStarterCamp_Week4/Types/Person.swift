//
//  Person.swift
//  CodeStarterCamp_Week4
//
//  Created by Jungmo Yu on 2022/01/01.
//

import Foundation

class Person {
    var name: String
    var bodyCondition: BodyCondition = BodyCondition()
    
    init(name: String = "", bodyCondition: BodyCondition = BodyCondition()) {
        self.name = name
        self.bodyCondition = bodyCondition
    }
    
    func defineExercise() {
        let 윗몸일으키기: Exercise = Exercise(name: "윗몸일으키기", action: {
            self.bodyCondition.upperBodyStrength += UInt.random(in: 10...20)
            self.bodyCondition.fatigue += Int.random(in: 10...20)
        })
        let 스쿼트: Exercise = Exercise(name: "스쿼트", action: {
            self.bodyCondition.lowerBodyStrength += UInt.random(in: 20...30)
            self.bodyCondition.fatigue += Int.random(in: 10...20)
        })
        let 오래달리기: Exercise = Exercise(name: "오래달리기", action: {
            self.bodyCondition.muscularEndurance += UInt.random(in: 20...30)
            self.bodyCondition.upperBodyStrength += UInt.random(in: 5...10)
            self.bodyCondition.lowerBodyStrength += UInt.random(in: 5...10)
            self.bodyCondition.fatigue += Int.random(in: 20...30)
        })
        let 동적휴식: Exercise = Exercise(name: "동적휴식", action: {
            self.bodyCondition.fatigue -= Int.random(in: 10...20)

            guard self.bodyCondition.fatigue >= 0 else {
                self.bodyCondition.fatigue = 0
                return
            }
        })
    }
    
    func exercise(for set: Int, routine: Routine) {
        var routineCount = 0
        print("--------------")
        print("\(routine.name)을 \(set)Set 시작합니다.")
        while routineCount < set {
            routineCount += 1
            routine.startRoutine()
        }
        print("--------------")
    }
}





