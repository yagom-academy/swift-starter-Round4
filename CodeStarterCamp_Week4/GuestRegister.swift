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
            if isValidStringInput(inputResult: inputResult, guestName: &guestName) {
                break
            }
        }
        
        return Person(name: guestName)
    }
    
    func inputName() -> Result<String, StringInputError> {
        guard let guestName = readLine() else {
            return .failure(.nilName)
        }
        
        guard guestName.isEmpty == false else {
            return .failure(.emptyName)
        }
        
        return .success(guestName)
    }
    
    func isValidStringInput(inputResult: Result<String, StringInputError>,
                            guestName: inout String) -> Bool {
        switch inputResult {
        case .success(let name):
            guestName = name
            return true
        case .failure(let namingError):
            print(namingError.errorDescription)            
            return false
        }
    }
    
    func inputCondition() -> Result<Int, IntegerInputError> {
        guard let condition = readLine() else {
            return .failure(.nilCount)
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
    
    func isValidIntegerInput(inputResult: Result<Int, IntegerInputError>,
                             inputValueReceiptor: inout Int) -> Bool {
        switch inputResult {
        case .success(let inputValue):
            inputValueReceiptor = inputValue
            return true
        case .failure(let error):
            print(error.errorDescription)
            return false
        }
    }
    
    func assignBodyCondtionValue(bodyPart: BodyPart) -> Int {
        var conditionValue: Int = 0
        while true {
            let conditionResult = inputCondition()
            if isValidIntegerInput(inputResult: conditionResult, inputValueReceiptor: &conditionValue) {
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
    
    func inputRoutine(routineLength: Int) -> Result<Int, IntegerInputError> {
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
    
    func assignRoutineCount(routineLength: Int) -> Int {
        var routeCountResult = 0
        while true {
            let routeInputResult = inputRoutine(routineLength: routineLength)
            if isValidIntegerInput(inputResult: routeInputResult, inputValueReceiptor: &routeCountResult) {
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
    
    func inputSet() -> Result<Int, IntegerInputError> {
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
    
    func assignSetOfRoutineCount() -> Int {
        var setOfRoutineCountResult = 0
        while true {
            let setInputResult = inputSet()
            if isValidIntegerInput(inputResult: setInputResult, inputValueReceiptor: &setOfRoutineCountResult) {
                break
            }
            print("몇 세트 루틴을 운동하시겠어요?")
        }
        return setOfRoutineCountResult
    }
}
