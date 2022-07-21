//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by 이준영 on 2022/07/20.
//

import Foundation

class Routine {
    var name: String
    var activities: Array<Activity>
    
    init(name: String, activities: Array<Activity>) {
        self.name = name
        self.activities = activities
    }
    
    func startRoutine(person: BodyCondition) throws -> Void {
        guard activities.isEmpty == false else {
            throw RoutineError.noRoutine
        }
        while let input = readLine() {
            guard let sets = Int(input) else {
                throw RoutineError.wrongInput
            }
            guard sets > 0 else {
                throw RoutineError.wrongInput
            }
            print("--------------")
            for set in 1...sets {
                print("\(translator(number: set)) 번째 \(self.name)을(를) 시작합니다.")
                for member in 0...(self.activities.count - 1) {
                    person.doActivity(self.activities[member])
                    guard person.fatigue <= 100 else {
                        throw RoutineError.fatigueAccumulation
                    }
                }
            }
            person.checkBodyCondition()
            break
        }
    }
}

func translator(number: Int) -> String {
    switch number {
    case 1:
        return "첫"
    case 2:
        return "두"
    case 3:
        return "세"
    default:
        return "\(number)"
    }
}

