//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by 이정민 on 2022/05/06.
//

import Foundation

class FitnessCenter {
    var targetBodyCondition: BodyCondition = BodyCondition()
    var member: Person? = nil
    var routineList: [Routine]
    
    init(routineList: [Routine]) {
        self.routineList = routineList
    }
    
    func register() {
        do {
            try enterName()
            try setTargetCondition()
        } catch FitnessCenterContingency.unrecognizedInputError {
            ErrorMessage.unrecognizedInputErrorMessage()
            
        } catch FitnessCenterContingency.stringToIntConvertError {
            ErrorMessage.stringToIntConvertErrorMessage()
            
        } catch FitnessCenterContingency.spillOverIndexError {
            ErrorMessage.spillOverIndexErrorMessage()
            
        } catch {
            print("Error: \(error)")
        }
    }
    
    private func enterName() throws {
        print("안녕하세요. 야곰 피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        guard let memberName = readLine() else {
            throw FitnessCenterContingency.unrecognizedInputError
        }
        
        self.member = Person(name: memberName)
    }
    
    private func setTargetCondition() throws {
        print("운동 목표치를 순서대로 알려주세요. 예시) 130 120 150 (상체근력:130, 하체근력:120, 근지구력:150)")
        guard let inputValue = readLine() else {
            throw FitnessCenterContingency.unrecognizedInputError
        }
        
        let receivedTargetCondition = inputValue.split(separator: " ").map({ Int($0) ?? ErrorValue.stringToIntConvertErrorValue })
        
        guard receivedTargetCondition.count == 3 else {
            throw FitnessCenterContingency.spillOverIndexError
        }
        
        guard !receivedTargetCondition.contains(ErrorValue.stringToIntConvertErrorValue) else {
            throw FitnessCenterContingency.stringToIntConvertError
        }
        
        self.targetBodyCondition.upperBodyStrength = receivedTargetCondition[0]
        self.targetBodyCondition.lowerBodyStrength = receivedTargetCondition[1]
        self.targetBodyCondition.endurancePower = receivedTargetCondition[2]
    }
    
    func workOut() {
        do {
            try isExistMember()
            let indexOfRoutine = try selectRoutine()
            let setsOfExercise = try selectRepeat()
            member?.exercise(for: setsOfExercise, routine: routineList[indexOfRoutine])
            
        } catch FitnessCenterContingency.notExistMemberError{
            ErrorMessage.notExistMemberErrorMessage()
        } catch FitnessCenterContingency.unrecognizedInputError {
            ErrorMessage.unrecognizedInputErrorMessage()
        } catch FitnessCenterContingency.stringToIntConvertError {
            ErrorMessage.stringToIntConvertErrorMessage()
        } catch {
            print("Error: \(error)")
        }
    }
    
    private func isExistMember() throws {
        guard member != nil else {
            throw FitnessCenterContingency.notExistMemberError
        }
    }
    
    private func selectRoutine() throws -> Int {
        print("몇 번째 루틴으로 운동하시겠어요?")
        for (idx, routine) in routineList.enumerated() {
            print("\(idx + 1). \(routine.routineName)")
        }
        
        guard let inputValue = readLine() else {
            throw FitnessCenterContingency.unrecognizedInputError
        }
        
        let selectRoutineIndex = Int(inputValue) ?? ErrorValue.stringToIntConvertErrorValue
        
        guard selectRoutineIndex != ErrorValue.stringToIntConvertErrorValue else {
            throw FitnessCenterContingency.stringToIntConvertError
        }
        
        return selectRoutineIndex - 1
        
    }
    
    private func selectRepeat() throws -> Int {
        print("몇 세트 반복하시겠어요?")
        guard let inputValue = readLine() else {
            throw FitnessCenterContingency.unrecognizedInputError
        }
        
        let repeatCount = Int(inputValue) ?? ErrorValue.stringToIntConvertErrorValue
        if repeatCount == ErrorValue.stringToIntConvertErrorValue {
            throw FitnessCenterContingency.stringToIntConvertError
        }
        
        return repeatCount
    }
    
}
