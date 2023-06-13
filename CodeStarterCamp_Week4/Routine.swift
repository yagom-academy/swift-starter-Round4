//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by 김예림 on 2023/06/13.
//

import Foundation

struct Routine {
    fileprivate var name: String
    private var activities: [Activity]
    
    init(name: String, activities: [Activity]) {
        self.name = name
        self.activities = activities
    }
    
    func startRoutine(bodyCondition: inout BodyCondition) {
        print("루틴을 몇 번 반복할까요?")
        
        while true {
            do {
                guard let repeatCount = Int(readLine()!), repeatCount > 0 else {
                    throw RoutineError.invalidInput
                }
            
                for count in 1...repeatCount {
                    print("--------------")
                    print("\(count) 번째 \(self.name)을(를) 시작합니다.")
                    try performRoutines(on: &bodyCondition)
                }
                printBodyCondition(bodyCondition: bodyCondition)
                break
            } catch RoutineError.invalidInput {
                print(RoutineError.invalidInput.description)
            } catch {
                print(RoutineError.otherError.description)
                break
            }
        }
    }
    
    private func performRoutines(on bodyCondition: inout BodyCondition) throws {
    
        for activity in activities {
            do {
                guard bodyCondition.fatigue < 100 else {
                    throw RoutineError.fatigueExceeded
                }
                activity.perform(on: &bodyCondition)
                print("--------------")
            } catch RoutineError.fatigueExceeded {
                print(RoutineError.fatigueExceeded.description)
            } catch RoutineError.otherError{
                print(RoutineError.otherError.description)
            }
        }
        
        
    }
}
