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
        do {
            self.member?.name = try inputName()
            self.goalBodyCondition = try inputGoalBodyCondition()
        } catch InputError.empty {
            print("값을 입력하지않았습니다. 값을 입력해주세요")
        } catch InputError.invaildValue {
            print("입력할 수 없는 값입니다.")
        } catch InputError.outOfValue {
            print("값의 갯수가 적거나 큽니다.")
        } catch {
            
        }
        
        executeRoutine()
    }
    
    func inputName() throws -> String {
        print("안녕하세요. 야곰 피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        let inputName: String = readLine()!
        guard inputName.isEmpty == false else {
            throw InputError.empty
        }
        
        return inputName
    }
    
    func inputGoalBodyCondition() throws -> BodyCondition {
        print("운동 목표치를 순서대로 알려주세요. 상체근력, 하체근력, 근지구력. (예시: 100 120 130)")
        let inputGoalBodyCondition = readLine()!
        let goalBodyConditionArray: [Int] = try inputGoalBodyCondition.split(separator: " ").map {
            guard let value = Int($0) else {
                throw InputError.invaildValue
            }
            return value
        }
        
        if goalBodyConditionArray.count != 3 {
            throw InputError.outOfValue
        }
        
        let bodyCondition: BodyCondition = .init(upperBodyStrength: goalBodyConditionArray[0], lowerBodyStrength: goalBodyConditionArray[1], muscularEndurance: goalBodyConditionArray[2], fatigue: 0)
        
        return bodyCondition
    }
    
    func inputRoutineSet() throws -> Void {
        print("몇 번째 루틴으로 운동하시겠어요?")
        var routineNumber = 1
        self.routine.forEach {
            print("\(routineNumber). \($0.name)")
            routineNumber += 1
        }
        let inputRoutine: String = readLine()!
        guard let _inputRoutine = Int(inputRoutine) else {
            throw InputError.invaildValue
        }
        
        switch _inputRoutine {
        case 1..<routineNumber:
            routineNumber = _inputRoutine - 1
        default:
            throw InputError.invaildValue
        }
        
        print("몇 세트 반복하시겠어요?")
        let inputSetNumber: String = readLine()!
        guard let setNumber = Int(inputSetNumber) else {
            throw InputError.invaildValue
        }
        
        member?.exercise(for: setNumber, routine: self.routine[routineNumber])
        routineNumber = 1
    }
    
    func executeRoutine() {
        do {
            try inputRoutineSet()
        } catch InputError.empty {
            print("값을 입력하지않았습니다. 값을 입력해주세요")
        } catch InputError.invaildValue {
            print("입력할 수 없는 값입니다.")
        } catch InputError.outOfValue {
            print("값의 갯수가 적거나 큽니다.")
        } catch {
            
        }
    }
}
