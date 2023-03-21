//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by tom on 2023/03/15.
//

import Foundation


final class Routine {
    let name: String
    let activities : [Activity]
    
    init(name: String, activities: [Activity]) {
        self.name = name
        self.activities = activities
    }
    
    func start(bodyCondition: BodyCondition) {
        print("루틴을 몇 번 반복할까요?", terminator: " ")
        var normalInput: Bool = true
        
        while normalInput == true {
        do {
            try startExerciseRoutine(with: bodyCondition)
            normalInput = false
            } catch ActivityError.overFatigue {
                print("피로도가 100(이/가)이 넘어 운동진행 불가")
                bodyCondition.currentCondition()
            } catch ActivityError.inputValue {
                print("잘못된 입력 형식입니다. 다시 입력해주세요.")
            } catch {
                print(error)
            }
        }
    }
    
    private func startExerciseRoutine(with bodyCondition: BodyCondition) throws {
        guard let input = readLine(),
              let routineCountIntInput = Int(input),
              routineCountIntInput > 0
        else { throw ActivityError.inputValue }
        for routineCount in 1...routineCountIntInput {
            print("\(routineCount) 번째 hellRoutine을(를) 시작합니다.")
            try checkFatigueExercise(bodyCondition: bodyCondition)
        }
        bodyCondition.currentCondition()
    }
    
    private func checkFatigueExercise(bodyCondition: BodyCondition) throws {
        for activity in activities {
            Activity.start(activity: activity, bodyCondition: bodyCondition)
            if bodyCondition.fatigue > 100 {
                throw ActivityError.overFatigue
            }
        }
    }
    
    
}
