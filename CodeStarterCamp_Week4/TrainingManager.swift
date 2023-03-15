//
//  TrainingManager.swift
//  CodeStarterCamp_Week4
//
//  Created by Daehoon Lee on 2023/03/15.
//

import Foundation

struct TrainingManager {
    static let shared = TrainingManager()
    let roundToKorean: Array<String> = ["첫", "두", "세"]
    
    mutating func startExercise(of routine: Routine, who bodyCondition: BodyCondition) {
        print("루틴을 몇 번 반복할까요?")

        while true {
            do {
                let input = try self.checkInputValid()
                print("--------------")
                for round in 1...input {
                    try print("\(changeInputToKorean(with: round)) 번째 \(routine.routineName)을(를) 시작합니다.")
                    for activity in routine.activities {
                        try activity.action(bodyCondition)
                    }
                }
            } catch HealthTrainingError.invalidInput {
                print("잘못된 입력 형식입니다. 다시 입력해주세요.")
                continue
            } catch HealthTrainingError.overFatigability {
                print("피로도가 100 이상입니다. 루틴을 중단합니다.")
            } catch HealthTrainingError.indexOutOfRange {
                print("루틴의 횟수가 너무 많습니다.")
            } catch {
                print(error)
            }
            
            bodyCondition.printMeasuredBodyCondition()
            break
        }
    }
    
    func checkInputValid() throws -> Int {
        guard let input = readLine(), let inputAsInt = Int(input), inputAsInt > 0 else {
            throw HealthTrainingError.invalidInput
        }
        
        return inputAsInt
    }
    
    func changeInputToKorean(with round: Int) throws -> String {
        guard roundToKorean.indices.contains(round - 1) else {
            throw HealthTrainingError.indexOutOfRange
        }
        
        return roundToKorean[round - 1]
    }
}
