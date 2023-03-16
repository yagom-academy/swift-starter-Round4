//
//  Maneger.swift
//  CodeStarterCamp_Week4
//
//  Created by minsong kim on 2023/03/15.
//

import Foundation

class Manager {
    var member: BodyCondition
    
    init(member: BodyCondition) {
        self.member = member
    }
    
    private func setCount() throws -> Int {
        print("루틴을 몇 번 반복할까요?")
        guard let input = readLine(), let inputValue = Int(input) else {
            throw Errors.unsuspectedInput
        }
        return inputValue
    }
    
    func setRound(routine: Routine) {
        var count: Int
        do {
            count = try setCount()
            self.roundLoop(number: count, name: routine)
        } catch Errors.unsuspectedInput {
            print("잘못된 입력 형식입니다. 다시 입력해주세요.")
            self.setRound(routine: routine)
        } catch {
            print("알 수 없는 오류입니다.")
        }
    }
    
    private func roundLoop(number: Int, name routine: Routine) {
        for count in 1...number {
            do {
                try member.fatigabilityCheck()
                print("\(count)번째 \(routine.name)을 시작합니다.")
                self.execrciseLoop(name: routine)
            } catch Errors.maxFatigability {
                print("루틴을 중단합니다.", terminator: "")
                break
            } catch Errors.minusFatigability {
                break
            } catch {
                print("알 수 없는 오류입니다.")
            }
        }
        print()
        member.conditionCheck()
    }
    
    private func execrciseLoop(name routine: Routine) {
        for activity in routine.activities {
            activity.action(member)
            print("--------------")
            do {
                try member.fatigabilityCheck()
            } catch Errors.maxFatigability {
                print("피로도가 100 이상입니다.", terminator: " ")
                break
            } catch Errors.minusFatigability {
                print("충분한 휴식을 취했습니다.")
                break
            } catch {
                print("알 수 없는 오류입니다.")
            }
            
        }
    }
}
