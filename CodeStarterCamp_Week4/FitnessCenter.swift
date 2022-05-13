//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by Seong A Oh on 2022/05/10.
//

import Foundation

class FitnessCenter {
    var goalBodyCondition: BodyCondition?
    var member: Person?
    var routine: [Routine]
    
    init(goal: BodyCondition, member: Person, routine: [Routine]) {
        self.goalBodyCondition = goal
        self.member = member
        self.routine = routine
    }
    
    convenience init(routine: [Routine] ) {
        self.init(goal: .init(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0),
                  member: .init(name: "", bodyCondition: .init(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)),
                  routine: routine)
    }
    
    func exercise() {
        self.member?.name = inputName()
        self.goalBodyCondition = inputGoalBodyCondition()
        
        executeRoutine()
    }
    
    func inputText() -> String {
        var inputText: String?
        while let _inputText = readLine() {
            if _inputText != "" {
                inputText = _inputText
                break
            } else {
                print(InputError.empty.localizedDescription)
            }
        }
        
        return inputText ?? ""
    }
    
    func inputInt() -> Int {
        var isInputNumberInt = false
        var inputNumber = inputText()
        var intNumber: Int?
        
        while isInputNumberInt == false {
            if let _inputNumber = Int(inputNumber) {
                intNumber = _inputNumber
                isInputNumberInt = true
            } else {
                print(InputError.invaildValue.localizedDescription)
                inputNumber = inputText()
            }
        }
        
        return intNumber ?? 0
    }
    
    func inputName() -> String {
        print("안녕하세요. 야곰 피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        let inputName = inputText()
        
        return inputName
    }
    
    func inputGoalBodyCondition() -> BodyCondition {
        print("운동 목표치를 순서대로 알려주세요.")
        let bodyConditionMenu = ["상체근력", "하체근력", "근지구력"]
        var goalBodyConditionArray: [Int] = []
        
        for number in 0...2 {
            print("\(bodyConditionMenu[number])을 입력하세요")
            goalBodyConditionArray.append(inputInt())
        }
        
        let bodyCondition = BodyCondition(upperBodyStrength: goalBodyConditionArray[0], lowerBodyStrength: goalBodyConditionArray[1], muscularEndurance: goalBodyConditionArray[2], fatigue: 0)
        
        return bodyCondition
    }
    
    func inputRoutineSet() {
        print("몇 번째 루틴으로 운동하시겠어요?")
        var routineNumber = 1
        self.routine.forEach {
            print("\(routineNumber). \($0.name)")
            routineNumber += 1
        }
        
        var inputRoutine = inputInt()
        let routineNumberRange = 1..<routineNumber
        while routineNumberRange.contains(inputRoutine) == false {
            print(InputError.outOfValue.localizedDescription)
            inputRoutine = inputInt()
        }
        
        print("몇 세트 반복하시겠어요?")
        let inputSetNumber = inputInt()
        
        member?.exercise(for: inputSetNumber, routine: self.routine[inputRoutine - 1])
        routineNumber = 1
    }
    
    func executeRoutine() {
        inputRoutineSet()
        
        guard let currentFatigue = member?.bodyCondition.fatigue else {
            return
        }
        
        if currentFatigue < 100 {
            if achieveGoalBodyCondition() {
                print("--------------")
                print("성공입니다!")
                member?.bodyCondition.currentCondition()
            } else {
                print("--------------")
                print("목표치에 도달하지 못했습니다.")
                member?.bodyCondition.currentCondition()
                executeRoutine()
            }
        }
    }
    
    func achieveGoalBodyCondition() -> Bool {
        guard let member = self.member, let goalBodyContition = self.goalBodyCondition else {
            return true
        }
        let currentBodyCondition = member.bodyCondition
        
        if currentBodyCondition.upperBodyStrength < goalBodyContition.upperBodyStrength {
            return false
        } else if currentBodyCondition.lowerBodyStrength < goalBodyContition.lowerBodyStrength {
            return false
        } else if currentBodyCondition.muscularEndurance < goalBodyContition.muscularEndurance {
            return false
        } else {
            return true
        }
    }
}
