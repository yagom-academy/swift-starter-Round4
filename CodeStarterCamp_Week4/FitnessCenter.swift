//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by 정선아 on 2022/05/10.
//

import Foundation

enum InputError: Error {
    case empty
    case outOfValue
    case invaildValue
}

class FitnessCenter {
    let name: String
    var targetBodyCondition: BodyCondition
    var member: Person?
    var listOfRoutine: [Routine]
    
    init(name: String, targetBodyCondition: BodyCondition, member: Person, listOfRoutine: [Routine]) {
        self.name = name
        self.targetBodyCondition = BodyCondition()
        self.member = member
        self.listOfRoutine = listOfRoutine
        
    }
    
    convenience init(name: String, listOfRoutine: [Routine]) {
        self.init(name: name, targetBodyCondition: BodyCondition(), member: Person(name: "", bodyCondition: BodyCondition()), listOfRoutine: listOfRoutine)
    }
    
    func exerciseRoutine() {
            do {
                self.member?.name = try writeName()
                self.targetBodyCondition = try inputBodyCondition()
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
        return inputName
    }
    
    func inputBodyCondition() throws -> BodyCondition {
        print("운동 목표치를 순서대로 알려주세요. [상체근력:  하체근력:  근지구력: ]")
        guard let inputTargetBodyCondition = readLine() else { throw InputError.empty }
        let targetBodyConditionArray: [Int] = try inputTargetBodyCondition.split(separator: " ").map{
            guard let number = Int($0) else { throw InputError.invaildValue }
            return number
        }
        
        if targetBodyConditionArray.count != 3 {
            throw InputError.outOfValue
        }
        
        let bodyCondition = BodyCondition()
        
        return bodyCondition
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
        
        if accomplishCondotion() {
            print("--------------")
            print("성공입니다!")
                member?.bodyCondition.checkYourCondition()
        } else {
            print("--------------")
            print("목표에 도달하지 못 했습니다. 현재 \(member?.name)님의 컨디션은 다음과 같습니다.")
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
