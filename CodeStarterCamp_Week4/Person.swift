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
    
    func exercise(routines: Routine, for set: Int) throws {
        let limitTiredness = 100
        print("--------------------")
        print("\(routines.name)을(를) \(set)set 시작합니다.")
        for setCounter in 1...set {
            print("--------------------")
            print("\(setCounter)set 시작!")
            let routineName = routines.routineArray.map( { $0.name } ).joined(separator: "\n")
            _ = routines.routineArray.map( { $0.action(bodyCondition) } )
            print(routineName)
            if bodyCondition.tiredness > limitTiredness {
                throw FitnessCenterError.runAwayMember
            }
        }
    }
    
    func printAfterBodyCondition() {
        print("--------------------")
        print("현재 \(name)님의 컨디션 입니다.")
        bodyCondition.printMucleStatus()
    }
}
