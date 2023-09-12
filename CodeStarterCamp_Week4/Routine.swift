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

    func start(with person: Person) {
        print("루틴을 몇 번 반복할까요?")
        var count = 0
        repeat {
            do {
                count += try readRepeatCount()
            }
            catch let error as RoutineInputError {
                switch error {
                case .cannotRead:
                    print("사용자의 입력을 받지 못했습니다.")
                case .notInt:
                    print("잘못된 입력 형식입니다. 다시 입력해주세요.")
                case .notPositiveNumber:
                    print("양의 정수여야 합니다.")
                }
            }
            catch {
                print(error)
            }
        } while count < 1

        print(sessionRepeat(count: count, with: person))
    }
}

// MARK: - Private

extension Routine {
    private func readRepeatCount() throws -> Int {
        guard let readValue = readLine() else {
            throw RoutineInputError.cannotRead
        }

        guard let result = Int(readValue) else {
            throw RoutineInputError.notInt
        }

        if result < 1 {
            throw RoutineInputError.notPositiveNumber
        }

        return result
    }

    private func sessionRepeat(count: Int, with person: Person) -> String {
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

                do {
                    result += try person.workout(activity)
                }
                catch PersonWorkoutError.tiredness {
                    result += "피로도가 100 이상입니다. 루틴을 중단합니다."
                    foundError = true
                }
                catch  {
                    result += "\(error)"
                    foundError = true
                }
                result += "\n"
            }
        }
        result += person.conditionMessage

        return result
    }
}
