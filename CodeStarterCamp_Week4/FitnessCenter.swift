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
    
    init(name: String, targetBodyCondition: BodyCondition, listOfRoutine: [Routine]) {
        self.name = name
        self.listOfRoutine = listOfRoutine
        self.targetBodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)
    }
    
    convenience init(name: String, listOfRoutine: [Routine]) {
        self.init(name: name, targetBodyCondition: BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0), listOfRoutine: listOfRoutine)
    }
    
    func error() {
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

            }
        }
    
    func writeName() throws -> String {
        print("안녕하세요. \(name)피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        let inputName: String = readLine()!
        guard inputName.isEmpty == false else { throw InputError.empty }
        return inputName
    }
    
    func inputBodyCondition() throws -> BodyCondition {
        print("운동 목표치를 순서대로 알려주세요. [상체근력:  하체근력:  근지구력: ]")
        let inputTargetBodyCondition = readLine()!
        let targetBodyConditionArray: [Int] = try inputTargetBodyCondition.split(separator: " ").map{
            guard let number = Int($0) else { throw InputError.invaildValue }
            return number
        }
        
        if targetBodyConditionArray.count != 3 {
            throw InputError.outOfValue
        }
        
        let bodtCondition = BodyCondition(upperBodyStrength: targetBodyConditionArray[0], lowerBodyStrength: targetBodyConditionArray[1], muscularEndurance: targetBodyConditionArray[2], fatigue: 0)
        
        return bodtCondition
    }
}
