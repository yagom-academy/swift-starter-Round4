//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum PersonError: Error {
    case beDrained
}

struct Person {
    let name: String
    var bodyCondition: BodyCondition
    
    init(name: String, bodyCondition: BodyCondition) {
        self.name = name
        self.bodyCondition = bodyCondition
    }
    
    func exercise(for set: Int, routine: Routine) throws {
        print(newLineString)
        print("\(routine.name) Routine \(set)Set Start!")
        for setCount in 1...set {
            print("\(setCount)Set")
            routine.startRoutine(based: bodyCondition)
            if bodyCondition.tiredness > 100 {
                throw PersonError.beDrained
            }
        }
    }
    
    func printMyBodyCondition() {
        print("현재 \(name)님의 컨디션입니다.")
        bodyCondition.informBodyCondition()
    }
}
