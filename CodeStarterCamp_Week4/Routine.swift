//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by Wonbi on 2022/05/12.
//

import Foundation

struct Routine {
    let name: String
    let routineArray: Array<Exercise>
    
    func printRotineList() {
        let routineList = routineArray.map{ $0.name }.joined(separator: "\n")
        print("""
              --------------
              \(self.name)을 실행합니다.
              \(routineList)
              """)
    }
    
    func startRoutine(affecting bodyCondition: BodyCondition) {
        for routineIndex in routineArray {
            routineIndex.action(bodyCondition)
        }
    }
}
