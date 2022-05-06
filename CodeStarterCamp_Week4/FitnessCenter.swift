//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by 이정민 on 2022/05/06.
//

import Foundation

class FitnessCenter {
    var targetBodyCondition: BodyCondition = BodyCondition()
    var member: Person? = nil
    var routineList: [Routine]
    
    init(routineList: [Routine]) {
        self.routineList = routineList
    }
    
    func register() {
        do {
            try enterName()
            try setTargetCondition()
        } catch FitnessCenterContingency.spillOverIndexError {
            ErrorMessage.spillOverIndexErrorMessage()
            
        } catch FitnessCenterContingency.stringToIntConvertError {
            ErrorMessage.stringToIntConvertErrorMessage()
            
        } catch {
            print("Error: \(error)")
        }
    }
    
    private func enterName() throws {
        print("안녕하세요. 야곰 피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        
        guard let memberName = readLine() else {
            throw FitnessCenterContingency.unexpectedInputError
        }
        
        self.member = Person(name: memberName)
    }
    
    private func setTargetCondition() throws {
        print("운동 목표치를 순서대로 알려주세요. 예시) 130 120 150 (상체근력:130, 하체근력:120, 근지구력:150)")
        
        guard let inputValue = readLine() else {
            throw FitnessCenterContingency.unexpectedInputError
        }
        
        let receivedTargetCondition = inputValue.split(separator: " ").map({ Int($0) ?? ErrorValue.stringToIntConvertErrorValue })
        
        if receivedTargetCondition.count > 3 {
            throw FitnessCenterContingency.spillOverIndexError
            
        } else if receivedTargetCondition.contains(ErrorValue.stringToIntConvertErrorValue) {
            throw FitnessCenterContingency.stringToIntConvertError
            
        } else {
            self.targetBodyCondition.upperBodyStrength = receivedTargetCondition[0]
            self.targetBodyCondition.lowerBodyStrength = receivedTargetCondition[1]
            self.targetBodyCondition.endurancePower = receivedTargetCondition[2]
        }
    }
}
