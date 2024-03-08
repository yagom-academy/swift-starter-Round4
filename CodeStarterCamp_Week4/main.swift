//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

let myBodyCondition = BodyCondition()
let myRoutine = Routine(name: "hellRoutine")

runSomeRoutine(myRoutine, by: myBodyCondition)

private func runSomeRoutine(_ routine: Routine, by condition: BodyCondition) {
    print("루틴을 몇 번 반복할까요?")
    
    while true {
        do {
            let number = try getUserInput()
            print("--------------")
            try myRoutine.runRoutine(times: number, with: condition)
            condition.printTotalConditionState()
            return
        } catch RoutineError.invalidInput {
            print(RoutineError.invalidInput.description)
        } catch RoutineError.notNaturalNumber {
            print(RoutineError.notNaturalNumber.description)
        } catch RoutineError.exceedingFatigue {
            print(RoutineError.exceedingFatigue.description)
            condition.printTotalConditionState()
            return
        } catch {
            print("알 수 없는 오류")
            return
        }
    }
}

private func getUserInput() throws -> Int {
    guard let number = Int(readLine()!) else { throw RoutineError.invalidInput }
    
    guard number > 0 else { throw RoutineError.notNaturalNumber }
    
    return number
}

enum RoutineError: Error {
    case invalidInput
    case notNaturalNumber
    case exceedingFatigue
    
    var description: String {
        switch self {
        case .invalidInput:
            "잘못된 입력 형식입니다. 다시 입력해주세요."
        case .notNaturalNumber:
            "0보다 큰 숫자를 입력해주세요."
        case .exceedingFatigue:
            "피로도가 100 이상입니다. 루틴을 중단합니다."
        }
    }
}
