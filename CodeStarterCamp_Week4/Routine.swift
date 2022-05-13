//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by Wonbi on 2022/05/12.
//

import Foundation

struct Routine {
    let name: String
    let routineContents: Array<Exercise>
    
    func printRotineList() {
        let routineList = routineContents.map{ $0.name }.joined(separator: "\n")
        print("""
              --------------
              🏋️\(self.name)🏋️
              \(routineList)
              """)
    }
    
    func startRoutine(affecting bodyCondition: BodyCondition) {
        print("""
              --------------
              \(self.name)을 실행합니다.
              ...🏃🏻💦💦
              """)
        for exerciseEvent in routineContents {
            exerciseEvent.action(bodyCondition)
        }
    }
}
