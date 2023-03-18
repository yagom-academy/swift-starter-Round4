//
//  TrainingManager.swift
//  CodeStarterCamp_Week4
//
//  Created by Daehoon Lee on 2023/03/15.
//

import Foundation

struct TrainingManager {
    let koreanOrdinalNumber: Array<String> = ["첫", "두", "세", "네"]
    
    mutating func startExercise(of routine: Routine, by bodyCondition: BodyCondition) {
        print("루틴을 몇 번 반복할까요?")

        while true {
            var round: Int = 0
            
            do {
                round = try self.checkInputValid()
                try self.checkRangeValid(with: round)
            } catch HealthTrainingError.invalidInput {
                print("잘못된 입력 형식입니다. 다시 입력해주세요.")
                continue
            } catch HealthTrainingError.outOfRange {
                print("루틴 횟수가 너무 많습니다. 다시 입력해주세요.")
                continue
            } catch {
                print(error)
            }
            
            print("--------------")
            self.executeRoutine(with: routine, by: bodyCondition, in: round)
            bodyCondition.printMeasuredBodyCondition()
            break
        }
    }
    
    func checkInputValid() throws -> Int {
        guard let input = readLine(),
              let inputAsInt = Int(input),
              inputAsInt > 0
        else {
            throw HealthTrainingError.invalidInput
        }
        
        return inputAsInt
    }
    
    func checkRangeValid(with round: Int) throws {
        guard koreanOrdinalNumber.indices.contains(round - 1) else {
            throw HealthTrainingError.outOfRange
        }
    }
    
    func executeRoutine(with routine: Routine, by bodyCondition: BodyCondition, in round: Int) {
        for per in 1...round {
            print("\(koreanOrdinalNumber[per - 1]) 번째 \(routine.name)을(를) 시작합니다.")
            self.executeActivity(of: routine, by: bodyCondition)
        }
    }
    
    func executeActivity(of routine: Routine, by bodyCondition: BodyCondition) {
        do {
            for activity in routine.activities {
                try activity.action(bodyCondition)
            }
        } catch HealthTrainingError.overFatigability {
            print("피로도가 100 이상입니다. 루틴을 중단합니다.")
        } catch {
            print(error)
        }
    }
}
