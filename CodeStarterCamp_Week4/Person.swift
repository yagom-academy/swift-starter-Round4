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
    var goalBodyCondition: BodyCondition = BodyCondition(upperBodyMuscleStrength: 0, lowerBodyMuscleStrength: 0, muscularEndurance: 0, tiredness: 0)
    
    init(name: String, bodyCondition: BodyCondition) {
        self.name = name
        self.bodyCondition = bodyCondition
    }
    
    func exercise(routines: Routine, sets: Int) throws {
        let limitTiredness = 100
        print("--------------------")
        print("\(routines.name)을(를) \(sets)set 시작합니다.")
        for set in 1...sets {
            print("--------------------")
            print("\(set)set 시작!")
            try _ = routines.exercises.map( {
                if bodyCondition.tiredness > limitTiredness {
                    throw FitnessCenterError.runAwayMember
                }
                $0.action(bodyCondition)
                print($0.name)
            } )
        }
    }
    
    func printBodyConditionAfterExercise() {
        bodyCondition.printMucleStatus()
    }
}
