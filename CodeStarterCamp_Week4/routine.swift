//
//  routine.swift
//  CodeStarterCamp_Week4
//
//  Created by minsong kim on 2023/03/14.
//

import Foundation

struct Routine {
    let name: String
    var activities = [Activity]()
    
    private func setCount() throws -> Int {
        print("루틴을 몇 번 반복할까요?")
        let input: String? = readLine()
        guard let inputValue = input.map ({ (value: String) -> Int in Int(value) ?? 0 }), inputValue > 0 else {
            throw RoutineError.unsuspectedInput
        }
        
        return inputValue
    }
    
    func setRoutine(_ name: BodyCondition) {
        var count: Int
        do {
            count = try setCount()
            for _ in 1...count {
                for index in activities {
                    index.action(name)
                }
            }
        } catch RoutineError.unsuspectedInput {
            print("잘못된 입력 형식입니다. 다시 입력해주세요.")
        } catch {
            print("알 수 없는 오류입니다.")
        }
    }
}
