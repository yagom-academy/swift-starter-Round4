//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by Hyungmin Lee on 2023/03/14.
//

import Foundation

struct FitnessCenter {
    enum FitnessCenterError: Error {
        case inputFormatError
        case overFatigueError(BodyCondition)
    }
    
    struct Routine {
        var name: String
        var activities: [Activity]
    }
    
    private let koreanCount = ["첫", "두", "세", "네", "다섯", "여섯", "일곱", "여덟", "아홉", "열"]
    
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
        let workout = Workout()
        let routine = Routine(name: "\(member.name)의 루틴", activities: [workout.오래달리기,
                                                             workout.스쿼트,
                                                             workout.동적휴식,
                                                             workout.윗몸일으키기,
                                                             workout.동적휴식])
        for count in 0..<routineCount {
            print("\(koreanCount[count]) 번째 \(routine.name)을(를) 시작합니다.")
            for activity in routine.activities {
                print("<<\(activity.name)을(를) 시작합니다>>")
                activity.action(member.bodyCondition)
                print("---------------")
                if member.bodyCondition.isOverFatigue() {
                    throw FitnessCenterError.overFatigueError(member.bodyCondition)
                }
            }
            member.bodyCondition.checkCondition()
        }
    }
}
