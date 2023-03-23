//
//  PersonalTrainer.swift
//  CodeStarterCamp_Week4
//
//  Created by redmango1446 on 2023/03/23.
//

import Foundation

struct personalTrainer {
    var routine: Routine
    
    func question() -> String? {
        var input: String?
        
        print("루틴을 몇 번 반복할까요?")
        print("횟수: ", terminator: "")
        input = readLine()
        print("-----------")
        
        return input
    }
    
    func checkInputError() -> Int {
        var checkResult: Bool = true
        var letter: String?
        var parsingNumber: Int = 0
        
        repeat {
            letter = question()
            do {
                try checkResult = consoleManager.checkInput(to: letter).result
                try parsingNumber = consoleManager.checkInput(to: letter).outputNumber
            } catch RoutineError.inputError {
                print("잘못된 입력 형식입니다. 다시 입력해주세요")
            } catch RoutineError.inputOverError {
                print("너무 많은 운동은 건강에 해가 될 수 있습니다. 다시 입력해주세요")
            } catch {
                print("알 수 없는 오류입니다.")
            }
        } while checkResult
        return parsingNumber
    }
    
    func doRoutine(to person: Person) throws {
        let loopCount: Int = checkInputError()
        var routineCountMessage: String
        
        for i in 1...loopCount {
            routineCountMessage = consoleManager.printRoutineMessage(routineCount: i,
                                                                  name: routine.name)
            if person.bodyCondition.fatigue <= 100 {
                print(routineCountMessage)
            }
            
            for activity in routine.activities {
                if person.bodyCondition.fatigue <= 100 {
                    activity.action(person)
                } else {
                    throw RoutineError.fatigueOverError
                }
            }
        }
    }
    
    func startRoutine(to condition: Person) {
        do {
            try doRoutine(to: condition)
        } catch RoutineError.fatigueOverError {
            print("피로도가 100 이상입니다. 루틴을 중단합니다.")
        } catch {
            print("알 수 없는 오류가 발생했습니다. 루틴을 중단합니다.")
        }
    }
}
