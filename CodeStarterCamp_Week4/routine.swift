//
//  routine.swift
//  CodeStarterCamp_Week4
//
//  Created by minsong kim on 2023/03/14.
//

import Foundation

struct Routine {
    let name: String
    var activities = [Activity]()
    
    private func setCount() -> Int {
        print("루틴을 몇 번 반복할까요?")
        let input: String? = readLine()
        guard let input = input, let inputValue = Int(input) else {
            return 0
        }
        return inputValue
    }
    
    func setRoutine(_ name: BodyCondition) {
        let count = self.setCount()
        for _ in 1...count {
            for index in activities {
                index.action(name)
            }
        }
    }
}
