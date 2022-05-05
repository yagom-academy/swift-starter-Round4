//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by 이정민 on 2022/05/06.
//

import Foundation

class FitnessCenter {
    var targetBodyCondition: BodyCondition? = nil
    var member: Person? = nil
    var routineList: [Routine]
    
    init(routineList: [Routine]) {
        self.routineList = routineList
    }
    
    func register() {
        do {
            try enterName()
            try setTargetCondition()
        } catch FitnessCenterContingency.unexpectedInputValue {
            print("인식할 수 없는 값입니다")
        } catch {
            print(error)
        }
    }
    
    private func enterName() throws {
        print("안녕하세요. 야곰 피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        
        guard let memberName = readLine() else {
            throw FitnessCenterContingency.unexpectedInputValue
        }
        
        self.member = Person(name: memberName)
    }
    
    private func setTargetCondition() throws {
        print("운동 목표치를 순서대로 알려주세요. 예시) 130 120 150 (상체근력:130,하체근력:120,근지구력:150)")
        
        guard let inputValue = readLine() else {
            throw FitnessCenterContingency.unexpectedInputValue
        }
        
        let receivedTargetCondition = inputValue.split(separator: " ").map({ Int($0) })
        if let upperCondition = receivedTargetCondition[0], let lowerCondition = receivedTargetCondition[1], let enduranceCondition = receivedTargetCondition[2] {
            targetBodyCondition?.upperBodyStrength = upperCondition
            targetBodyCondition?.lowerBodyStrength = lowerCondition
            targetBodyCondition?.endurancePower = enduranceCondition
        }
    }
}
