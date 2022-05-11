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
    var selectedRoutineIndex = 0
    var repeatCount = 0
    let inputManager = InputManager()
    
    mutating func greeting() throws {
        print("안녕하세요. 야곰 피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        guard let memberName = readLine() else {
            throw FitnessError.noMember
        }
        self.member = Person(name: memberName)
    }
    
    mutating func setGoal(of bodyPart: Int) {
        do {
            bodyConditionGoal.changeCondition(of: bodyPart, about: try inputManager.changeInputToInt())
        } catch FitnessError.wrongInput {
            print(FitnessError.wrongInput.rawValue)
        } catch {
            print(FitnessError.unexpectedError.rawValue)
        }
    }
    
    mutating func setExerciseGoal() {
        print("운동 목표치를 순서대로 알려주세요.")
        print("상체근력: ", terminator: "")
        setGoal(of: bodyConditionGoal.upperBodyStrength)
        
        print("하체근력: ", terminator: "")
        setGoal(of: bodyConditionGoal.lowerBodyStrength)
        
        print("근지구력: ", terminator: "")
        setGoal(of: bodyConditionGoal.muscularEndurance)

        print("한계 피로도: ", terminator: "")
        setGoal(of: bodyConditionGoal.fatigue)
    }
    
    func showRoutine() {
        print("몇 번째 루틴으로 운동하시겠어요?")
        for i in 0..<routineLists.count {
            print("\(i+1). \(routineLists[i].routineName)")
        }
    }
    
    mutating func selectRoutine() throws {
        showRoutine()
        do {
            selectedRoutineIndex = try inputManager.changeInputToInt() - 1
        } catch FitnessError.wrongInput {
            print(FitnessError.wrongInput.rawValue)
        }
    }
    
    mutating func repeatRoutine() throws {
        print("몇 세트 반복하시겠어요? ", terminator: "")
        do {
            repeatCount = try inputManager.changeInputToInt()
        } catch FitnessError.wrongInput {
            print(FitnessError.wrongInput.rawValue)
        } catch {
            print(FitnessError.unexpectedError.rawValue)
        }
    }
    
    func compareGoal(with bodyCondition: BodyCondition) throws -> Bool {
        guard bodyCondition.upperBodyStrength >= bodyConditionGoal.upperBodyStrength,
              bodyCondition.lowerBodyStrength >= bodyConditionGoal.lowerBodyStrength,
              bodyCondition.muscularEndurance >= bodyConditionGoal.muscularEndurance else {
                  throw FitnessError.underTarget
              }
        return true
    }
    
    mutating func consultMember() {
        do {
            try greeting()
            setExerciseGoal()
            try selectRoutine()
            try repeatRoutine()
        } catch FitnessError.noMember {
            print(FitnessError.noMember.rawValue)
        } catch FitnessError.wrongInput {
            print(FitnessError.wrongInput.rawValue)
        } catch {
            print(FitnessError.unexpectedError.rawValue)
        }
    }
    
    func startExercise() {
        if let member = member {
            do {
                try member.exercise(for: repeatCount, routine: routineLists[selectedRoutineIndex], until: bodyConditionGoal.fatigue)
                if try compareGoal(with: member.bodyCondition) == true {
                    print("""
                        --------------
                        성공입니다! 현재 \(member.name)님의 컨디션은 다음과 같습니다.
                        """)
                    member.bodyCondition.showCondition()
                }
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
                print(FitnessError.unexpectedError.rawValue)
            }
        }
    }
    
    mutating func beginTraining() {
        consultMember()
        print("""
                --------------
                \(routineLists[selectedRoutineIndex].routineName)을 \(repeatCount)set시작합니다.
                """)
        startExercise()
    }
}

