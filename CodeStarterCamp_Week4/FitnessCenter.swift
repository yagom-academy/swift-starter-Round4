//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by Hyungmin Lee on 2023/03/14.
//

import Foundation

enum FitnessCenterError: Error {
    case inputFormatError
    case overFatigueError(BodyCondition)
}

struct FitnessCenter {
    func healthTraining() {
        do {
            try startRoutine()
        } catch FitnessCenterError.inputFormatError {
            print("잘못된 입력 형식입니다. 다시 입력해주세요.")
        } catch FitnessCenterError.overFatigueError(let bodyCondition) {
            print("피로도가 100 이상입니다. 루틴을 중단합니다.")
            bodyCondition.checkCondition()
        } catch {
            print("에러가 발생했습니다.")
        }
        
    }
    
    private
    func startRoutine() throws {
        print("루틴을 몇 번 반복할까요?")
        guard let input = readLine(), let routineCount = Int(input),
              routineCount > 0, routineCount <= 10 else {
            throw FitnessCenterError.inputFormatError
        }
        print("---------------")
        
        let member = Person(name: "Zion", BodyCondition(upperBodyStrength: 30, lowerBodyStrength: 30,
                                                        muscleEndurance: 50, fatigue: 24))
        do {
            try member.startWorkout(routineCount)
        } catch FitnessCenterError.overFatigueError(let bodyCondition) {
            throw FitnessCenterError.overFatigueError(bodyCondition)
        }
    }
}
