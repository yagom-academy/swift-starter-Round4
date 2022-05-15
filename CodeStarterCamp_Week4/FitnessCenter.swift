//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by 정선아 on 2022/05/10.
//

import Foundation

class FitnessCenter {
    let name: String
    var bodyGoal: [Int] = [0, 0, 0]
    var member: Person?
    var listOfRoutine: [Routine]
    
    init(name: String, listOfRoutine: [Routine]) {
        self.name = name
        self.listOfRoutine = listOfRoutine
    }
    
    func exerciseRoutine() {
        do {
            let memberName = try writeName()
            member = Person(name: memberName, bodyCondition: BodyCondition())
            
            bodyGoal = try inputbodyGoal()
        } catch InputError.empty {
            print("입력되지 않았습니다. 다시 입력해주세요.")
        } catch InputError.invaildValue {
            print("없는 번호입니다. 다시 입력해주세요.")
        } catch InputError.outOfValue {
            print("값의 갯수가 적거나 큽니다.")
        } catch {
            print("알 수 없는 오류입니다. 다시 시도해주세요.")
        }
        tryRoutine()
    }
    
    func writeName() throws -> String {
        print("안녕하세요. \(name)피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        guard let inputName = readLine() else { throw InputError.empty }
        guard inputName.isEmpty == false else { throw InputError.empty }
        return inputName
    }
    
    func inputbodyGoal() throws -> [Int] {
        print("운동 목표치를 순서대로 알려주세요. [상체근력:  하체근력:  근지구력: ]")
        print("목표치간 띄어쓰기는 필수입니다. ex) 100 100 100")
        guard let inputbodyGoal = readLine(), inputbodyGoal.isEmpty == false else { throw InputError.empty }
        let inputbodyGoalArray: [Int] = inputbodyGoal.split(separator: " ").compactMap{Int($0)}
        guard inputbodyGoalArray.count == 3  else { throw InputError.outOfValue }
        return inputbodyGoalArray
    }
    
    func tryRoutine() {
        do {
            try choiceRoutine()
        } catch InputError.empty {
            print("입력되지 않았습니다. 다시 입력해주세요.")
        } catch InputError.invaildValue {
            print("없는 번호입니다. 다시 입력해주세요.")
        } catch InputError.outOfValue {
            print("값의 갯수가 적거나 큽니다.")
        } catch {
            print("알 수 없는 오류입니다. 다시 시도해주세요.")
        }
    }
    
    func choiceRoutine() throws -> Void {
        print("몇 번째 루틴으로 운동하시겠어요?")
        var routineNumber = 1
        self.listOfRoutine.forEach {
            print("\(routineNumber). \($0.routineName)")
            routineNumber += 1
        }
        
        guard let inputRoutine = readLine() else { throw InputError.empty }
        guard let innerRoutine = Int(inputRoutine) else { throw InputError.invaildValue }
        
        switch innerRoutine {
        case 1..<routineNumber:
            routineNumber = innerRoutine - 1
        default: throw InputError.outOfValue
        }
        
        print("몇 세트 반복하시겠어요?")
        
        guard let inputSetCount = readLine() else { throw InputError.empty }
        guard let countNumber = Int(inputSetCount) else { throw InputError.invaildValue }
        
        member?.doExercise(for: countNumber, routine: self.listOfRoutine[routineNumber])
        routineNumber = 1
        
        guard member?.bodyCondition.fatigue ?? 0 < 100 else {
            print("[알림] 운동을 할 회원이 없으므로, 프로그램이 종료됩니다.")
            return
        }
        
        if accomplishCondotion() {
            print("--------------")
            print("성공입니다!")
            member?.bodyCondition.checkYourCondition()
        } else {
            print("--------------")
            print("목표에 도달하지 못 했습니다. 현재 '\(member?.name ?? "이름없음")'님의 컨디션은 다음과 같습니다.")
            member?.bodyCondition.checkYourCondition()
            print("--------------")
            tryRoutine()
        }
    }
    
    func accomplishCondotion() -> Bool {
        let currentBodyCondition = member?.bodyCondition
        guard currentBodyCondition?.upperBodyStrength ?? 0 < targetBodyCondition.upperBodyStrength  else { return false }
        guard currentBodyCondition?.lowerBodyStrength ?? 0 < targetBodyCondition.lowerBodyStrength  else { return false }
        guard currentBodyCondition?.muscularEndurance ?? 0 < targetBodyCondition.muscularEndurance else { return false }
        return true
    }
}
