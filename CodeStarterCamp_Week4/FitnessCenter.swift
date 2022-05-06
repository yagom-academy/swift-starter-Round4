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
        } catch FitnessCenterContingency.unRecognizedInputError {
            print("인식할 수 없는 값입니다.")
            exit(1)
            
        } catch FitnessCenterContingency.stringToIntConvertError {
            print("정수로 변환할 수 없습니다.")
            exit(1)
            
        } catch FitnessCenterContingency.invalidNumberOfValuesError {
            print("너무 적거나 많은 값을 입력했습니다.")
            exit(1)
            
        } catch {
            print("\(error)")
        }
    }
    
    private func enterName() throws {
        print("안녕하세요. 야곰 피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        guard let memberName = readLine() else {
            throw FitnessCenterContingency.unRecognizedInputError
        }

        print(deFramentation(memberName))
        self.member = Person(name: deFramentation(memberName))
    }
    
    private func setTargetCondition() throws {
        print("운동 목표치를 순서대로 알려주세요. 예시) 130 120 150 (상체근력:130, 하체근력:120, 근지구력:150)")
        guard let inputValue = readLine() else {
            throw FitnessCenterContingency.unRecognizedInputError
        }
        
        let receivedTargetCondition = inputValue.split(separator: " ").map({ Int($0) ?? ErrorValue.stringToIntConvertErrorValue })
        
        guard receivedTargetCondition.count == 3 else {
            throw FitnessCenterContingency.invalidNumberOfValuesError
        }
        
        guard !receivedTargetCondition.contains(ErrorValue.stringToIntConvertErrorValue) else {
            throw FitnessCenterContingency.stringToIntConvertError
        }
        
        self.targetBodyCondition.upperBodyStrength = receivedTargetCondition[0]
        self.targetBodyCondition.lowerBodyStrength = receivedTargetCondition[1]
        self.targetBodyCondition.endurancePower = receivedTargetCondition[2]
    }
    
    func workOut() {
        guard let member = member else {
            return
        }
        do {
            try checkExistMember()
            let indexOfRoutine = try selectRoutine()
            let setsOfExercise = try selectRepeat()
            
            member.exercise(for: setsOfExercise, routine: routineList[indexOfRoutine])
            
            try checkMemberExhausted()
            try checkEnoughForTarget()
            
            print("""
            --------------
            성공입니다! 현재 \(member.name)님의 컨디션은 다음과 같습니다.
            """)
            
            member.showCondition()
            
        } catch FitnessCenterContingency.notExistMemberError{
            print("회원이 존재하지 않습니다.")
            exit(1)
            
        } catch FitnessCenterContingency.unRecognizedInputError {
            print("인식할 수 없는 값입니다.")
            exit(1)
            
        } catch FitnessCenterContingency.stringToIntConvertError {
            print("정수로 변환할 수 없습니다.")
            exit(1)
            
        } catch FitnessCenterContingency.exhaustedMemberError {
            print("""
            --------------
            \(member.name)님의 피로도가 \(member.bodyCondition.fatigue)입니다. 회원님이 도망갔습니다.
            """)
            
            self.member = nil
            
        } catch FitnessCenterContingency.notEnoughToTargetError {
            print("""
            --------------
            목표치에 도달하지 못했습니다 현재 \(member.name)님의 컨디션은 다음과 같습니다.
            """)
            
            member.showCondition()
            workOut()
        } catch {
            print("\(error)")
        }
    }
    
    private func checkExistMember() throws {
        guard self.member != nil else {
            throw FitnessCenterContingency.notExistMemberError
        }
    }
    
    private func selectRoutine() throws -> Int {
        print("""
        --------------
        몇 번째 루틴으로 운동하시겠어요?
        """)
        for (idx, routine) in routineList.enumerated() {
            print("\(idx + 1). \(routine.routineName)")
        }
        
        guard let inputValue = readLine() else {
            throw FitnessCenterContingency.unRecognizedInputError
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
            throw FitnessCenterContingency.unRecognizedInputError
        }
        
        let repeatCount = Int(inputValue) ?? ErrorValue.stringToIntConvertErrorValue
        if repeatCount == ErrorValue.stringToIntConvertErrorValue {
            throw FitnessCenterContingency.stringToIntConvertError
        }
        
        return repeatCount
    }
    
    private func checkMemberExhausted() throws {
        if let fatigue = member?.bodyCondition.fatigue {
            if fatigue > 100 {
                throw FitnessCenterContingency.exhaustedMemberError
            }
        }
    }
    
    private func checkEnoughForTarget() throws {
        if let member = member {
            let memberCondition = member.bodyCondition
            let target = targetBodyCondition
            
            if target.upperBodyStrength > memberCondition.upperBodyStrength &&
                target.lowerBodyStrength > memberCondition.lowerBodyStrength &&
                target.endurancePower > memberCondition.endurancePower {
                throw FitnessCenterContingency.notEnoughToTargetError
            }
        }
    }
}
