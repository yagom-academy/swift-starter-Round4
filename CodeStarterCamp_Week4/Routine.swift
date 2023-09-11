//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by QL Jeong on 2023/09/11.
//

import Foundation

struct Routine {
    let name: String
    let activities: [Activity]

    func start(with people: People) {
        print("루틴을 몇 번 반복할까요?")
        var count = 0
        repeat {
            let countResult = readRepeatCount()
            switch countResult {
            case .success(let value):
                count = value
            case .failure(let error):
                print(errorMessage(for: error))
            }
        } while count < 1

        print(sessionRepeat(count: count, with: people))
    }
}

// MARK: - Private

extension Routine {
    private func readRepeatCount() -> Result<Int, RoutineInputError> {
        guard let readValue = readLine() else {
            return .failure(.cannotRead)
        }

        guard let result = Int(readValue) else {
            return .failure(.notInt)
        }

        if result < 1 {
            return .failure(.notPositiveNumber)
        }

        return .success(result)
    }

    private func sessionRepeat(count: Int, with people: People) -> String {
        var result = ""
        var foundError = false
        for number in 1...count {
            if foundError {
                break
            }

            result += "\(number.koreanNumberString(style: .rankCardinal)) 번째 \(name)을(를) 시작합니다.\n"
            for activity in activities {
                if foundError {
                    break
                }

                let workoutResult = workout(activity, with: people)
                switch workoutResult {
                case .success(let message):
                    result += message
                case .failure(let error):
                    result += errorMessage(for: error)
                    foundError = true
                }
                result += "\n"
            }
        }
        result += people.conditionMessage

        return result
    }

    private func workout(_ activity: Activity, with people: People) -> Result<String, PeopleWorkoutError> {
        do {
            return .success(try people.workout(activity))
        }
        catch {
            return .failure(error as! PeopleWorkoutError)
        }
    }

    private func errorMessage(for error: RoutineInputError) -> String {
        switch error {
        case .cannotRead:
            fallthrough
        case .notInt:
            return "잘못된 입력 형식입니다. 다시 입력해주세요."
        case .notPositiveNumber:
            return "양의 정수여야 합니다."
        }
    }

    private func errorMessage(for error: PeopleWorkoutError) -> String {
        switch error {
        case .tiredness:
            return "피로도가 100 이상입니다. 루틴을 중단합니다."
        }
    }
}
