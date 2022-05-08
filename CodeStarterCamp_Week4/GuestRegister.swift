//
//  GuestRegister.swift
//  CodeStarterCamp_Week4
//
//  Created by 황지웅 on 2022/05/09.
//

import Foundation

struct GuestRegister {
    func assignPersonalInfo() -> Person {
        var guestName: String = ""
        while true {
            let inputResult = inputName()
            if isValidPersonalInfo(inputResult: inputResult, guestName: &guestName) {
                break
            }
        }
        
        return Person(name: guestName)
    }
    
    func inputName() -> Result<String, NamingError> {
        guard let guestName = readLine() else {
            return .failure(.nilName)
        }
        
        guard guestName.isEmpty == false else {
            return .failure(.emptyName)
        }
        
        return .success(guestName)
    }
    
    func isValidPersonalInfo(inputResult: Result<String, NamingError>, guestName: inout String) -> Bool {
        switch inputResult {
        case .success(let name):
            guestName = name
            return true
        case .failure(let namingError):
            if namingError == .emptyName {
                print("이름이 비어있습니다! 다시 입력해 주세요!")
            } else {
                print("잘못된 입력이 있던 모양이에요. 다시 입력해 주세요!")
            }
            return false
        }
    }
    
    func inputCondition() -> Result<Int, BodyConditionError> {
        guard let condition = readLine() else {
            return .failure(.nilCondition)
        }
        
        if condition.isEmpty {
            return .failure(.emptyInput)
        }
        
        guard let conditionValue = Int(condition) else {
            return .failure(.stringInput)
        }
        
        if conditionValue.isNagative {
            return .failure(.negativeValue)
        }
        
        return .success(conditionValue)
    }
    
    func isValidConditionInfo(conditionResult: Result<Int, BodyConditionError>, conditionValue: inout Int) -> Bool {
        switch conditionResult {
        case .success(let conditionInput):
            conditionValue = conditionInput
            return true
        case .failure(.nilCondition):
            print("값을 입력해 주세요!")
            return false
        case .failure(.emptyInput):
            print("값이 비어있어요 다시 입력해주세요!")
            return false
        case .failure(.stringInput):
            print("숫자만 입력해주세요")
            return false
        case .failure(.negativeValue):
            print("양수만 입력해주세요! 음수는 안됩니다")
            return false
        }
    }
    
    func assignBodyCondtionValue(bodyPart: BodyPart) -> Int {
        var conditionValue: Int = 0
        while true {
            let conditionResult = inputCondition()
            if isValidConditionInfo(conditionResult: conditionResult, conditionValue: &conditionValue) {
                break
            }
            print("\(bodyPart.rawValue): ", terminator: "")
        }
        return conditionValue
    }
        
    func assignGoalBodyCondition() -> BodyCondition {
        print("상체근력: ", terminator: "")
        let upperBody = assignBodyCondtionValue(bodyPart: .upperBody)
        
        print("하체근력: ", terminator: "")
        let lowerBody = assignBodyCondtionValue(bodyPart: .lowerBody)
        
        print("근지구력: ", terminator: "")
        let muscularEndurance = assignBodyCondtionValue(bodyPart: .muscularEndurance)
        
        return BodyCondition(upperBody: upperBody,
                             lowerBody: lowerBody,
                             muscularEndurance: muscularEndurance,
                             fatigue: 0)
    }
    
    func inputRoutine(routineLength: Int) -> Result<Int, RoutineSelectError> {
        guard let routeInputResult = readLine() else {
            return .failure(.nilCount)
        }
        
        if routeInputResult.isEmpty {
            return .failure(.emptyInput)
        }
        
        guard let routeInputValue = Int(routeInputResult) else {
            return .failure(.stringInput)
        }
        
        if routeInputValue.isNagative {
            return .failure(.negativeValue)
        }
        
        if routeInputValue > routineLength || routeInputValue <= 0 {
            return .failure(.overIndex)
        }
        
        return .success(routeInputValue)
    }
    
    func isValidRoutineCount(routeInputResult: Result<Int, RoutineSelectError>,
                             routeCountResult: inout Int) -> Bool {
        switch routeInputResult {
        case .success(let routeCnt):
            routeCountResult = routeCnt
            return true
        case .failure(.overIndex):
            print("우리 피트니스 센터에서 할수 있는 운동 루틴이 아니에요")
            return false
        case .failure(.negativeValue):
            print("양수를 입력해주세요!")
            return false
        case .failure(.stringInput):
            print("숫자로 입력해주세요")
            return false
        case .failure(.nilCount):
            print("숫자를 입력해 주세요!")
            return false
        case .failure(.emptyInput):
            print("값이 비어있습니다. 다시 입력해주세요")
            return false
        }
    }
    
    func assignRoutineCount(routineLength: Int) -> Int {
        var routeCountResult = 0
        while true {
            let routeInputResult = inputRoutine(routineLength: routineLength)
            if isValidRoutineCount(routeInputResult: routeInputResult, routeCountResult: &routeCountResult) {
                break
            }
            print("""
            몇 번째 루틴으로 운동하시겠어요?
            1. helloRoutine
            2. ohMyGodRoutine
            """)
        }
        return routeCountResult
    }
    
    func inputSet() -> Result<Int, CountOfSetSelectError> {
        guard let setInput = readLine() else {
            return .failure(.nilCount)
        }
        
        guard let setValue = Int(setInput) else {
            return .failure(.stringInput)
        }
        
        if setValue.isNagative {
            return .failure(.negativeValue)
        }
        
        return .success(setValue)
    }
    
    func isValidSetCount(setInputResult: Result<Int, CountOfSetSelectError>,
                         setOfRoutineCountResult: inout Int) -> Bool {
        switch setInputResult {
        case .success(let setResult):
            setOfRoutineCountResult = setResult
            return true
        case .failure(.nilCount):
            print("값을 제대로 입력해주세요")
            return false
        case .failure(.negativeValue):
            print("음수 말고 양수로 입력해주세요")
            return false
        case .failure(.stringInput):
            print("숫자만 입력해주십쇼")
            return false
        case .failure(.emptyInput):
            print("값이 비어있습니다. 다시 입력해주세요")
            return false
        }
    }
    
    func assignSetOfRoutineCount() -> Int {
        var setOfRoutineCountResult = 0
        while true {
            let setInputResult = inputSet()
            if isValidSetCount(setInputResult: setInputResult,
                                   setOfRoutineCountResult: &setOfRoutineCountResult) {
                break
            }
            print("몇 세트 루틴을 운동하시겠어요?")
        }
        return setOfRoutineCountResult
    }
}
