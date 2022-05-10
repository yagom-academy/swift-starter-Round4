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
    let routineList: [Routine]
    
    init(routineList: [Routine]) {
        self.routineList = routineList
    }
    
    func register() {
        if (try? enterName()) != nil {
            var isRetry = true
            while isRetry {
                do {
                    try setTargetCondition()
                    isRetry = false
                } catch FitnessCenterContingency.unRecognizedInputError {
                    if let errorDescription = FitnessCenterContingency.unRecognizedInputError.errorDescription {
                        print(errorDescription)
                    }
                } catch FitnessCenterContingency.stringToIntConvertError {
                    if let errorDescription = FitnessCenterContingency.stringToIntConvertError.errorDescription {
                        print(errorDescription)
                    }
                } catch FitnessCenterContingency.invalidNumberOfValuesError {
                    if let errorDescription = FitnessCenterContingency.invalidNumberOfValuesError.errorDescription {
                        print(errorDescription)
                    }
                } catch {
                    print("\(error)")
                    exit(1)
                }
            }
        } else {
            if let errorDescription = FitnessCenterContingency.unRecognizedInputError.errorDescription {
                print(errorDescription)
            }
            register()
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
        guard let member = member else {
            print("회원이 존재하지 않습니다.")
            return
        }
        
        do {
            repeat {
                let indexOfRoutine = try selectRoutine()
                let setsOfExercise = try selectRepeat()
                
                for count in 1...setsOfExercise {
                    member.exercise(for: count, routine: routineList[indexOfRoutine])
                    if member.bodyCondition.fatigue > Person.maxFatigue {
                        runAway(member)
                        return
                    }
                }
            } while !isEnoughConditionFor(member)
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
        } catch {
            print("\(error)")
            exit(1)
        }
    }
    
    private func selectRoutine() throws -> Int {
        var result = 0
        let routineListLength = routineList.count
        
        repeat {
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
            
            result = selectRoutineIndex
            if result > routineListLength {
                print("\(routineListLength) 이하의 값을 입력해 주세요.")
            }
        } while result > routineListLength
        
        return result - 1
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
    
    private func runAway(_ member: Person) {
        print("""
              --------------
              \(member.name) 님의 피로도가 \(member.bodyCondition.fatigue)입니다. 회원님이 도망갔습니다.
              """)
        self.member = nil
        workOut()
    }
    
    private func isEnoughConditionFor(_ member: Person) -> Bool{
        let memberCondition = member.bodyCondition
        let target = targetBodyCondition
        
        if target.upperBodyStrength > memberCondition.upperBodyStrength &&
            target.lowerBodyStrength > memberCondition.lowerBodyStrength &&
            target.endurancePower > memberCondition.endurancePower {
            print("""
                  --------------
                  목표치에 도달하지 못했습니다. 현재 \(member.name)님의 컨디션은 다음과 같습니다.
                  """)
            member.showCondition()
            return false
        } else {
            print("""
                  --------------
                  성공입니다! 현재 \(member.name)님의 컨디션은 다음과 같습니다.
                  """)
            member.showCondition()
            return true
        }
    }
}
