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
    
    func exercise(routines: Routine, for set: Int) throws {
        let limitTiredness = 100
        print("--------------------")
        print("\(routines.name)을(를) \(set)set 시작합니다.")
        for setCounter in 1...set {
            print("--------------------")
            print("\(setCounter)set 시작!")
            try _ = routines.routineArray.map( {
                if bodyCondition.tiredness > limitTiredness {
                    throw FitnessCenterError.runAwayMember
                }
                $0.action(bodyCondition)
                print($0.name)
            } )
        }
    }
    
    func printAfterBodyCondition() {
        print("--------------------")
        print("현재 \(name)님의 컨디션 입니다.")
        bodyCondition.printMucleStatus()
    }
}
