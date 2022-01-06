//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by 조성훈 on 2022/01/06.
//

import Foundation

var inputNameFromReadline: String?
var inputGoalFromReadline = BodyCondition()
var selectRoutineFromReadline: Routine = .init(name: "", exerciseArray: [])
var inputSetFromReadline: Int = 0
var inputGoalOfBodyCondition = BodyCondition()

enum ProgramErrror: Error {
    case valueIsNotMember(sendName: String)
    case valueIsNil
    case valueIsEmpty
    case valueIsNotInt
    case vlaueIsNotString
    case valueIsOutOfRange
    case valueIsNotPositiveNumber
}

class FitnessCenter {
    var goalOfBodyCondition = inputGoalOfBodyCondition
    var members: [Person?] = []
    var routineList: [Routine] = []
    
    func startExcercise() {
        print("안녕하세요. 야곰 피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        checkInputName()
        checkInputGoal()
        selectRoutineFromReadline = checkSelectRoutine()
        inputSetFromReadline = checkInputSet()
    }
    
    func inputName() throws -> String {
        guard let inputMemberName = readLine() else { throw ProgramErrror.valueIsNil }
        
        guard inputMemberName.isEmpty == false else {
            throw ProgramErrror.valueIsEmpty
        }
        guard members.map({$0?.name}).contains(inputMemberName) else {
            throw ProgramErrror.valueIsNotMember(sendName: inputMemberName)
        }
        return inputMemberName
    }
    
    func checkInputName() {
        do {
            let resultInputName = try inputName()
            print("\(resultInputName)님, 반갑습니다.")
        } catch ProgramErrror.valueIsEmpty {
            print("이름을 입력하지 않았습니다. 다시 입력하세요.")
            return checkInputName()
        } catch ProgramErrror.valueIsNotMember(let resultName) {
            print("\(resultName)은 회원 명단에 없습니다. 다시 입력하세요.")
            return checkInputName()
        } catch { }
    }
    
    func inputGoal() throws {
        print("운동 목표치를 순서대로 알려주세요. 예시) 상체근력:130,하체근력:120,근지구력:150")
        
        print("상체근력:", terminator: "")
        guard let inputUpperBodyGoal = readLine() else { throw ProgramErrror.valueIsNil }
        print("하체근력:", terminator: "")
        guard let inputLowerBodyGoal = readLine() else { throw ProgramErrror.valueIsNil }
        print("근지구력:", terminator: "")
        guard let inputMuscleEnduranceGoal = readLine() else { throw ProgramErrror.valueIsNil }
 
        guard inputUpperBodyGoal.isEmpty == false &&
                inputLowerBodyGoal.isEmpty == false &&
                inputMuscleEnduranceGoal.isEmpty == false else {
                    throw ProgramErrror.valueIsEmpty
        }
        
        guard let inputUpperBodyGoalToIntType = Int(inputUpperBodyGoal),
                let inputLowerBodyGoalToIntType = Int(inputLowerBodyGoal),
                let inputMuscleEnduranceGoalToIntType = Int(inputMuscleEnduranceGoal) else {
            throw ProgramErrror.valueIsNotInt
        }
        
        guard inputUpperBodyGoalToIntType > 0,
                inputLowerBodyGoalToIntType > 0,
                inputMuscleEnduranceGoalToIntType > 0 else {
            throw ProgramErrror.valueIsNotPositiveNumber
        }
        
        inputGoalOfBodyCondition.upperBodyStrength = inputUpperBodyGoalToIntType
        inputGoalOfBodyCondition.lowerBodyStrength = inputLowerBodyGoalToIntType
        inputGoalOfBodyCondition.muscleEndurance = inputMuscleEnduranceGoalToIntType
    }
    
    func checkInputGoal() {
        do {
            try inputGoal()
        } catch ProgramErrror.valueIsEmpty {
            print("목표치를 입력하지 않았습니다. 다시 입력하세요.")
            return checkInputGoal()
        } catch ProgramErrror.valueIsNotInt {
            print("숫자를 입력하세요.")
            return checkInputGoal()
        } catch ProgramErrror.valueIsNotPositiveNumber {
            print("음수는 입력할 수 없습니다.")
            return checkInputGoal()
        } catch { return checkInputGoal() }
    }
    
    func selectRoutine() throws -> Int {
        for count in 1...routineList.count {
            print("\(count). \(routineList[count-1].name)")
        }
        guard let selectedNumber = readLine() else {
            throw ProgramErrror.valueIsNil }
        guard let selectedNumberToInt = Int(selectedNumber) else {
            throw ProgramErrror.valueIsNotInt }
        guard selectedNumberToInt > 0 else {
            throw ProgramErrror.valueIsNotPositiveNumber
        }
        guard selectedNumberToInt <= routineList.count else {
            throw ProgramErrror.valueIsOutOfRange
        }
        return selectedNumberToInt - 1
    }
    
    func checkSelectRoutine() -> Routine {
        do {
            let selectNumber = try selectRoutine()
            return routineList[selectNumber]
        } catch ProgramErrror.valueIsNil {
            print("숫자를 입력하세요")
            return checkSelectRoutine()
        } catch ProgramErrror.valueIsNotInt {
            print("숫자를 입력하세요")
            return checkSelectRoutine()
        } catch ProgramErrror.valueIsNotPositiveNumber {
            print("음수는 입력할 수 없습니다.")
            return checkSelectRoutine()
        } catch ProgramErrror.valueIsOutOfRange {
            print("숫자를 잘 못 입력했습니다.")
            return checkSelectRoutine()
        } catch { return checkSelectRoutine() }
    }
    
    func inputSet() throws -> Int {
        print("몇 세트 반복하시겠어요?:", terminator: "")
        guard let inputSetNumber = readLine() else {
            throw ProgramErrror.valueIsNil
        }
        guard let inputSetNumberToInt = Int(inputSetNumber) else {
            throw ProgramErrror.valueIsNotInt
        }
        guard inputSetNumber.isEmpty == false else {
            throw ProgramErrror.valueIsEmpty
        }
        guard inputSetNumberToInt > 0 else {
            throw ProgramErrror.valueIsNotPositiveNumber
        }
        return inputSetNumberToInt
    }
    
    func checkInputSet() -> Int {
        do {
            let setNumber = try inputSet()
            return setNumber
        } catch ProgramErrror.valueIsNotInt {
            print("숫자를 입력하세요.")
            return checkInputSet()
        } catch ProgramErrror.valueIsEmpty{
            print("숫자를 입력하세요.")
            return checkInputSet()
        } catch ProgramErrror.valueIsNotPositiveNumber {
            print("음수는 입력할 수 없습니다.")
            return checkInputSet()
        } catch { return checkInputSet() }
    }
}


