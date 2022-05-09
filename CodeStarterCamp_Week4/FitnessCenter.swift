//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by 이정민 on 2022/05/06.
//

import Foundation

class FitnessCenter {
    var targetBodyCondition = BodyCondition()
    var member: Person?
    var routineList: [Routine]
    
    init(routineList: [Routine]) {
        self.routineList = routineList
    }
    
    func register() {
        do {
            try enterName()
            try setTargetCondition()
        } catch FitnessCenterContingency.unRecognizedInputError {
            if let errorDescription = FitnessCenterContingency.unRecognizedInputError.errorDescription {
                print(errorDescription)
            }
            register()
        } catch FitnessCenterContingency.stringToIntConvertError {
            if let errorDescription = FitnessCenterContingency.stringToIntConvertError.errorDescription {
                print(errorDescription)
            }
            register()
        } catch FitnessCenterContingency.invalidNumberOfValuesError {
            if let errorDescription = FitnessCenterContingency.invalidNumberOfValuesError.errorDescription {
                print(errorDescription)
            }
            register()
        } catch {
            print("\(error)")
            exit(1)
        }
    }
    
    private func enterName() throws {
        print("안녕하세요. 야곰 피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        guard let memberName = readLine() else {
            throw FitnessCenterContingency.unRecognizedInputError
        }
        
        self.member = Person(name: memberName)
    }
    
    private func setTargetCondition() throws {
        print("운동 목표치를 순서대로 알려주세요. 예시) 130 120 150 (상체근력:130, 하체근력:120, 근지구력:150)")
        guard let inputValue = readLine() else {
            throw FitnessCenterContingency.unRecognizedInputError
        }
        
        let receivedTargetCondition = inputValue.split(separator: " ").map({ Int($0) ?? ErrorValue.stringToIntConvertErrorValue })
        
        guard !receivedTargetCondition.contains(ErrorValue.stringToIntConvertErrorValue) else {
            throw FitnessCenterContingency.stringToIntConvertError
        }
        
        guard receivedTargetCondition.count == 3 else {
            throw FitnessCenterContingency.invalidNumberOfValuesError
        }
        
        self.targetBodyCondition.upperBodyStrength = receivedTargetCondition[0]
        self.targetBodyCondition.lowerBodyStrength = receivedTargetCondition[1]
        self.targetBodyCondition.endurancePower = receivedTargetCondition[2]
    }
    
    func workOut() {
        do {
            try checkExistMember()
            let indexOfRoutine = try selectRoutine()
            let setsOfExercise = try selectRepeat()
            
            member!.exercise(for: setsOfExercise, routine: routineList[indexOfRoutine])
            
            try checkMemberExhausted()
            try checkEnoughForTarget()
            
            print("""
                  --------------
                  성공입니다! 현재 \(member!.name)님의 컨디션은 다음과 같습니다.
                  """)
            member!.showCondition()
            
        } catch FitnessCenterContingency.notExistMemberError {
            if let errorDescription = FitnessCenterContingency.notExistMemberError.errorDescription {
                print(errorDescription)
            }
            exit(1)
        } catch FitnessCenterContingency.unRecognizedInputError {
            if let errorDescription = FitnessCenterContingency.unRecognizedInputError.errorDescription {
                print(errorDescription)
            }
            workOut()
        } catch FitnessCenterContingency.stringToIntConvertError {
            if let errorDescription = FitnessCenterContingency.stringToIntConvertError.errorDescription {
                print(errorDescription)
            }
            workOut()
        } catch FitnessCenterContingency.exhaustedMemberError {
            if let errorDescription = FitnessCenterContingency.exhaustedMemberError.errorDescription {
                print("""
                      --------------
                      \(errorDescription)
                      \(member!.name) 님의 피로도가 \(member!.bodyCondition.fatigue)입니다. 회원님이 도망갔습니다.
                      """)
            }
            self.member = nil
            workOut()
        } catch FitnessCenterContingency.notEnoughToTargetError {
            if let errorDescription = FitnessCenterContingency.notEnoughToTargetError.errorDescription {
                print("""
                      --------------
                      \(errorDescription) 현재 \(member!.name)님의 컨디션은 다음과 같습니다.
                      """)
            }
            member!.showCondition()
            workOut()
        } catch {
            print("\(error)")
            exit(1)
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
            if fatigue > Person.MaxFatigue {
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
