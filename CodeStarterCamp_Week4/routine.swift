//
//  routine.swift
//  CodeStarterCamp_Week4
//
//  Created by minsong kim on 2023/03/14.
//

import Foundation

class Routine {
    let name: String
    var activities = [Activity]()
    
    init(name: String, activities: [Activity]) {
        self.name = name
        self.activities = activities
    }
    
    func setCount() throws -> Int {
        print("루틴을 몇 번 반복할까요?")
        guard let input = readLine(), let inputValue = Int(input) else {
            throw Errors.unsuspectedInput
        }
        return inputValue
    }
    
    func round(_ member: BodyCondition, from manager: Manager) {
        var count: Int
        do {
            count = try setCount()
            manager.exercise(round: count)
        } catch Errors.unsuspectedInput {
            print("잘못된 입력 형식입니다. 다시 입력해주세요.")
            manager.setRoutine()
        } catch {}
    }
}
