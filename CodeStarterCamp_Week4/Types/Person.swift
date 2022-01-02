//
//  Person.swift
//  CodeStarterCamp_Week4
//
//  Created by Jungmo Yu on 2022/01/01.
//

import Foundation

class Person {
    var name: String
    var bodyCondition: BodyCondition = publicBodyCondition
    
    init(name: String = "") {
        self.name = name
    }
    
    func exercise(for set: Int, routine: Routine) throws {
        var routineCount = 0
        print("--------------")
        print("\(routine.name) \(set)Set 시작합니다.")
        while routineCount < set {
            routineCount += 1
            routine.startRoutine()
        }
        print("--------------")
        guard self.bodyCondition.fatigue < 100 else { throw FitnessError.HighFatigue }
    }
}





