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
    
    func exercise(routineArray: Routine, for set: Int, overTiredness: Int) throws {
        print("--------------------")
        print("\(routineArray.name)을(를) \(set)set 시작합니다.")
        for _ in 1...set {
            try routineArray.startExercise(with: bodyCondition, overTiredness: 100)
            }
        }
    
    func printAfterBodyCondition() {
        print("--------------------")
        print("현재 \(name)님의 컨디션 입니다.")
        bodyCondition.printMucleStatus()
    }
}
