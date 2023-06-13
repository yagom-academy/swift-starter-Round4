//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by ChoiKwangWoo on 2023/06/10.
//

import Foundation

struct Routine {
    let name: String
    var activities: [ActivityType] = [
        ActivityType.running,
        ActivityType.situp,
        ActivityType.squat,
        ActivityType.rest
    ]
    
    func initiateRoutine(condition: BodyCondition) throws {
        print("루틴을 몇 번 반복할까요?\t", terminator: "")
        let enteredKey = readLine() ?? ""
        let routineCount: Int = try validate(enterKey: enteredKey)
        
        for count in 1...routineCount {
            print("\(count)번 째 \(self.name)Routine을 시작합니다.")
            printLine()
            try doActivity(condition: condition)
        }
    }
    
    private func doActivity(condition: BodyCondition) throws {
        for activity in self.activities {
            try condition.enhanceMuscle(activityType: activity)
            printLine()
        }
        condition.showCurrentBodyCondition()
    }
    
    private func validate(enterKey: String) throws -> Int {
        guard let routineCount = Int(enterKey) else {
            throw RoutineError.invalidInput
        }
        
        guard routineCount > 0 else {
            throw RoutineError.negativeNumber
        }
        
        return routineCount
    }
}
