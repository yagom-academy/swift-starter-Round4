//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by 김인호 on 2022/05/09.
//

import Foundation

struct FitnessCenter {
    var bodyConditionGoal = BodyCondition()
    var member: Person?
    var routineLists: [Routine]
    
    mutating func greeting() throws {
        print("안녕하세요. 야곰 피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        guard let memberName = readLine() else {
            throw FitnessError.noMember
        }
        self.member = Person(name: memberName)
    }
    
    mutating func setExerciseGoal() throws {
        print("운동 목표치를 순서대로 알려주세요.")
        do {
            print("상체근력: ", terminator: "")
            bodyConditionGoal.changeCondition(of: bodyConditionGoal.upperBodyStrength, about: try changeInputToInt())
        } catch FitnessError.wrongInput {
            print(FitnessError.wrongInput.rawValue)
        } catch {
            print(FitnessError.unexpectedError.rawValue)
        }
        
        do {
            print("하체근력: ", terminator: "")
            bodyConditionGoal.changeCondition(of: bodyConditionGoal.lowerBodyStrength, about: try changeInputToInt())
        } catch FitnessError.wrongInput {
            print(FitnessError.wrongInput.rawValue)
        } catch {
            print(FitnessError.unexpectedError.rawValue)
        }
        
        do {
            print("근지구력: ", terminator: "")
            bodyConditionGoal.changeCondition(of: bodyConditionGoal.muscularEndurance, about: try changeInputToInt())
        } catch FitnessError.wrongInput {
            print(FitnessError.wrongInput.rawValue)
        } catch {
            print(FitnessError.unexpectedError.rawValue)
        }
        
        do {
            print("한계 피로도: ", terminator: "")
            bodyConditionGoal.changeCondition(of: bodyConditionGoal.fatigue, about: try changeInputToInt())
        } catch FitnessError.wrongInput {
            print(FitnessError.wrongInput.rawValue)
        } catch {
            print(FitnessError.unexpectedError.rawValue)
        }
    }
    
    func showRoutine() {
        print("몇 번째 루틴으로 운동하시겠어요?")
        for i in 0..<routineLists.count {
            print("\(i+1). \(routineLists[i].routineName)")
        }
    }
    
    mutating func selectRoutine() throws -> Int {
        showRoutine()
        var selectedRoutineIndex: Int = 0
        do {
            selectedRoutineIndex = try changeInputToInt() - 1
        } catch FitnessError.wrongInput {
            print(FitnessError.wrongInput.rawValue)
        }
        return selectedRoutineIndex
    }
    
    mutating func repeatRoutine() throws -> Int {
        var repeatCount = 0
        print("몇 세트 반복하시겠어요? ", terminator: "")
        do {
            repeatCount = try changeInputToInt()
        } catch FitnessError.wrongInput {
            print(FitnessError.wrongInput.rawValue)
        } catch {
            print(FitnessError.unexpectedError.rawValue, error)
        }
        return repeatCount
    }
    
    func compareGoal(with bodyCondition: BodyCondition) throws {
        guard bodyCondition.upperBodyStrength >= bodyConditionGoal.upperBodyStrength,
              bodyCondition.lowerBodyStrength >= bodyConditionGoal.lowerBodyStrength,
              bodyCondition.muscularEndurance >= bodyConditionGoal.muscularEndurance else {
                  throw FitnessError.underTarget
              }
        if let member = member {
            print("""
                --------------
                성공입니다! 현재 \(member.name)님의 컨디션은 다음과 같습니다.
                """)
            member.bodyCondition.showCondition()
        }
    }
    
    mutating func startExercise() {
        var selectedRoutineIndex = 0
        var repeatCount = 0
        
        do {
            try greeting()
            try setExerciseGoal()
            selectedRoutineIndex = try selectRoutine()
            repeatCount = try repeatRoutine()
        } catch FitnessError.noMember {
            print(FitnessError.noMember.rawValue)
        } catch FitnessError.wrongInput {
            print(FitnessError.wrongInput.rawValue)
        } catch {
            print(FitnessError.unexpectedError.rawValue, error)
        }
        
        print("""
                --------------
                \(routineLists[selectedRoutineIndex].routineName)을 \(repeatCount)set시작합니다.
                """)
        
        if let member = member {
            do {
                try member.exercise(for: repeatCount, routine: routineLists[selectedRoutineIndex], until: bodyConditionGoal.fatigue)
                try compareGoal(with: member.bodyCondition)
            } catch FitnessError.exhaustion {
                print("""
                    --------------
                    \(member.name)님의 피로도가 \(member.bodyCondition.fatigue)입니다. \(FitnessError.exhaustion.rawValue)
                    """)
            } catch FitnessError.underTarget {
                print("""
                    --------------
                    \(FitnessError.underTarget.rawValue) 현재 \(member.name)님의 컨디션은 다음과 같습니다.
                    """)
                member.bodyCondition.showCondition()
                print("--------------")
                showRoutine()
            } catch {
                print(FitnessError.unexpectedError.rawValue, error)
            }
        }
    }
}

func changeInputToInt() throws -> Int {
    guard let input = readLine(), let integer = Int(input) else {
        throw FitnessError.wrongInput
    }
    return integer
}
