//
//  routine.swift
//  CodeStarterCamp_Week4
//
//  Created by hanjongwoo on 2022/07/15.
//

import Foundation

class Routine {
    let name: String
    let activities: Array<Activity>
    
    init(_ name: String, _ activities: Array<Activity>) {
        self.name = name
        self.activities = activities
    }
    
    func doRoutine() throws {
        let input = readLine() ?? ""
        
        guard let intInput = Int(input) else {
            print("There is nil in intInput")
            return
        }
        
        guard intInput > 0 else {
            throw RoutineError.wrongInput
        }
        print("--------------")
        for i in 1...intInput {
            print("\(i) 번째 \(self.name)을(를) 시작합니다.")
            for act in self.activities {
                print("<<\(act.name)을(를) 시작합니다>>")
                act.action(act.bodyConditions)
                print("--------------")
                guard 피로도.value < 100 else{
                    throw RoutineError.fatigueOverflow
                }
            }
        }
        printCondition()
    }
}
